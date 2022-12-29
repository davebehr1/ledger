package main

import (
	"database/sql"
	"flag"
	"fmt"
	"log"
	"os"
	"payments/seed"

	_ "github.com/lib/pq"
)

func main() {
	fmt.PrintlN("hello world")
	//there we go bru
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
			fmt.Println("seeded database...")
			os.Exit(0)
		}
	}

}
