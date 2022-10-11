drop materialized view account_balances;

DROP TRIGGER trigger_fix_balance_entries ON ledger;
DROP TRIGGER trigger_fix_balance_accounts ON accounts;

DROP FUNCTION update_balances;  