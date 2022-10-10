-- User makes deposit - (credit user account, debit cash account)
insert
	into
	ledger (description,
	amount,credit,debit)
values ('recieved cash',1000, 1,2);

-- User makes withdrawal - (debit user account, credit cash account)
insert
	into
	ledger (description,
	amount,credit,debit)
values ('withdrew cash',500, 2,1);