-- User makes deposit - (credit user account, debit cash account)
 insert into ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('debit_user_account',1,1,300,NULL),
       ('debit_cash_account',2,1,NULL,294),
	   ('debit_card_processing_fees',4,1,NULL,6);

-- transfer from david to jane
 insert into ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('debit_user_account',1,4,NULL,50),
       ('credit_user_account',6,4,50,NULL);

-- withdrawal
insert into ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('debit_user_account',1,2,NULL,102.50),
       ('credit_cash_account',2,2,100,NULL),
	   ('credit_revenue_fees',3,2,2.50,NULL);

-- withdrawal
insert
	into
	ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('debit_user_account',1,3,NULL,52.50),
       ('credit_cash_account',2,3,50,NULL),
	   ('credit_revenue_fees',3,3,2.50,NULL);