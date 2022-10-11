CREATE TABLE accounts(
	id serial PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    account_group_id INT NOT NULL REFERENCES account_groups (id) ON DELETE RESTRICT
);