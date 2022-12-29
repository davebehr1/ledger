-- User makes deposit - (credit user account, debit cash account)
 insert into ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('user_deposit',1,1,300,NULL),
       ('user_deposit',2,1,NULL,294),
	   ('user_deposit_fee',4,1,NULL,6);

-- transfer from david to jane
 insert into ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('internal_account_transfer',1,4,NULL,50),
       ('internal_account_transfer',6,4,50,NULL);

-- withdrawal
insert into ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('user_withdrawal',1,2,NULL,102.50), -- decrease user account
       ('user_withdrawal',2,2,100,NULL), -- decrease cash account
	   ('user_withdrawal_fee',3,2,2.50,NULL);

-- withdrawal
insert
	into
	ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('user_withdrawal',1,3,NULL,52.50), -- decrease user account (debit)
       ('user_withdrawal',2,3,50,NULL), -- decrease cash account (credit)
	   ('user_withdrawal_fee',3,3,2.50,NULL); -- increase fee (credit)

-- chargeback
insert
	into
	ledger (description,
	account_id ,
    transaction,
	credit,
	debit)
values ('charge_back',4,5,NULL,4), -- increase expenses (debit)
	   ('charge_back',2,5,44,NULL), -- reduce the amount of cash (credit)
	   ('charge_back',1,5,NULL,40); -- reduce the user account (debit)