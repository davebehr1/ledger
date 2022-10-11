package seed

import (
	"database/sql"
	"io/ioutil"
)

type Seed struct {
	Db *sql.DB
}

func (s Seed) Execute() {
	for _, file := range []string{"db/seeds/accounts_seed.sql", "db/seeds/transactions_seed.sql", "db/seeds/ledger_seed.sql"} {
		q, err := ioutil.ReadFile(file)
		if err != nil {
			panic(err)
		}

		_, err = s.Db.Exec(string(q))
		if err != nil {
			panic(err)
		}
	}
}
