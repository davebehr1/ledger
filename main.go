package main

import (
	"database/sql"
	"flag"
	"log"
	"os"
	"payments/seed"

	_ "github.com/lib/pq"
)

func main() {
	flag.Parse()
	args := flag.Args()

	connStr := "postgresql://postgres:postgres@localhost?sslmode=disable"
	// Connect to database
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		log.Fatal(err)
	}

	if err != nil {
		log.Fatal(err)
	}

	defer db.Close()

	newSeed := &seed.Seed{
		Db: db,
	}

	if len(args) >= 1 {
		switch args[0] {
		case "seed":
			newSeed.Execute()
			os.Exit(0)
		}
	}

}
