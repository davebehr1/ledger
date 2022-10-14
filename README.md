# ledger

## inspired by https://www.moderntreasury.com/journal/accounting-for-developers-part-ii.

- This implementation caters for splits
- This implementation enforces that ledger entries balance on the database level (all entries are commited or none at all).

## Run instructrions:
- brew install golang-migrate on mac if you havent already
- docker-compose up
- make migrateup
- go run main.go seed
