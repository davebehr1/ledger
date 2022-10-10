package seed

import (
	"database/sql"
	"io/ioutil"
)

type Seed struct {
	Db *sql.DB
}

func (s Seed) Execute() {
	q, err := ioutil.ReadFile("db/seeds/ledger_seed.sql")
	if err != nil {
		panic(err)
	}

	_, err = s.Db.Exec(string(q))
	if err != nil {
		panic(err)
	}
}
