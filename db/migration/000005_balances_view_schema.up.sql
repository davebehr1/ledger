create materialized view account_balances (id,account_name,account_type,account_balance) as
select
	account_id,
	enriched_ledger.name,
	type,
	case
		when type = 'credit_normal' then sum(coalesce(credit, 0) + coalesce (-debit, 0))
		else sum(coalesce(-credit, 0) + coalesce (debit, 0))
	end as balance
from
	(
	select
		account_id,
		temp_ledger.name,
		type,
		credit,
		debit
	from
		(
		select
			accounts.id as account_id,
			name,
			account_group_id,
			credit,
			debit
		from
			accounts
		left join ledger on
			ledger.account_id = accounts.id) as temp_ledger
	inner join account_groups on
		account_groups.id = temp_ledger.account_group_id) as enriched_ledger
group by
	enriched_ledger.account_id,
	type,
	enriched_ledger.name;

CREATE FUNCTION update_balances() RETURNS TRIGGER AS $$
BEGIN
	REFRESH MATERIALIZED VIEW account_balances;
	RETURN NULL;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_fix_balance_entries
AFTER INSERT 
ON ledger
FOR EACH STATEMENT
EXECUTE PROCEDURE update_balances();

CREATE TRIGGER trigger_fix_balance_accounts
AFTER INSERT 
OR UPDATE OF id 
OR DELETE OR TRUNCATE
ON accounts
FOR EACH STATEMENT
EXECUTE PROCEDURE update_balances();