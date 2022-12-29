INSERT INTO  account_groups (name,type) VALUES ('user_wallet','credit_normal'),
                                         ('cash','debit_normal'),
                                         ('revenue','credit_normal'),
                                         ('expenses','debit_normal');


INSERT INTO  accounts (name,account_group_id) VALUES ('davids_wallet',1),
                                         ('cash',2),
                                         ('revenue',3),
                                         ('expenses',4),
                                         ('johns_wallet',1),
                                         ('janes_wallet',1);