CREATE VIEW account_ledgers(
	account_id,
	entry_id,
	amount
) AS
	SELECT
		ledger.credit,
		ledger.id,
		ledger.amount
	FROM
		ledger
	UNION ALL
	SELECT
		ledger.debit,
		ledger.id,
		(0.0 - ledger.amount)
	FROM
		ledger;