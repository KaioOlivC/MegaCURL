#!/bin/bash

echo Will register Akina!

dbPrompt=$(cat ../.dbPrompt.txt)
dbName=$(cat ../.dbName.txt)

body='{
	"name":     "Akina Nakamori",
	"nickname": "Akina-chan",
	"phone":    "987654321",
	"email":    "akina@jpop.co.jp",
	"password": "Akina1*pass"
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/user/register | jq
echo ""

echo Altering DB to confirm email...
$dbPrompt 'UPDATE Users SET isEmailConfirmed=1 WHERE name="Akina Nakamori"' $dbName

echo Done!
