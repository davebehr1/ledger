CREATE TABLE ledger(
	id serial PRIMARY KEY,
	description VARCHAR(1024) NOT NULL,
	amount NUMERIC(20, 2) NOT NULL CHECK (amount > 0.0),
	credit INTEGER NOT NULL REFERENCES accounts(id) ON DELETE RESTRICT,
	debit INTEGER NOT NULL REFERENCES accounts(id) ON DELETE RESTRICT
);

CREATE INDEX ON ledger(credit);
CREATE INDEX ON ledger(debit);