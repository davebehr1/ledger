create table transactions (
	id serial PRIMARY KEY,
	type int not NULL,
	reference text null,
	allocated bool default false
);