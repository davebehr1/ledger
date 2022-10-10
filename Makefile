migrateup:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://postgres:postgres@localhost?sslmode=disable" -verbose down