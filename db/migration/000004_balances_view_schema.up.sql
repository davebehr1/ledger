CREATE MATERIALIZED VIEW account_balances(
	id,
	balance
) AS
	SELECT
		accounts.id,
		COALESCE(sum(account_ledgers.amount), 0.0)
	FROM
		accounts
		LEFT OUTER JOIN account_ledgers
		ON accounts.id = account_ledgers.account_id
	GROUP BY accounts.id;

CREATE UNIQUE INDEX ON account_balances(id);