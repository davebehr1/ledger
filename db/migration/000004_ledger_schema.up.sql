CREATE TABLE ledger(
	id serial PRIMARY KEY,
    created_at TIMESTAMP NOT NULL default NOW(),
    transaction INTEGER NOT NULL references transactions(id) on delete restrict,
	description VARCHAR(1024) NOT NULL,
    account_id INTEGER REFERENCES accounts(id) ON DELETE RESTRICT,
	credit NUMERIC CHECK (credit > 0.0),
	debit  NUMERIC CHECK (debit > 0.0),
    CHECK (num_nonnulls(debit, credit) = 1)
);

create or replace function check_balance()
returns trigger as 
$$
begin
	if sum(coalesce(-credit,0) + coalesce(debit,0)) <> 0
		from ledger
		where xmin::text::bigint = txid_current()
			then
		raise exception 'Entries not balanced!';
	end if;
	return null;
end;
$$ language plpgsql;

create constraint trigger check_balance after
insert
	on
	ledger deferrable initially deferred for each row execute procedure check_balance();