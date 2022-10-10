CREATE TABLE accounts(
	id serial PRIMARY KEY,
	name VARCHAR(256) NOT NULL,
    type VARCHAR(256) NOT NULL
);

INSERT INTO  accounts (name,type) VALUES ('user_wallet','credit_normal'),
                                         ('cash','debit_normal'),
                                         ('revenue','credit_normal'),
                                         ('expenses','debit_normal');