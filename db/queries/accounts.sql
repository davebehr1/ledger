-- name: GetAccount :one
SELECT * FROM accounts
WHERE id = ? LIMIT 1;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY name;

-- name: CreateAccount :execresult
INSERT INTO accounts (
  name
) VALUES (
  ?
);

-- name: DeleteAccount :exec
DELETE FROM accounts
WHERE id = ?;