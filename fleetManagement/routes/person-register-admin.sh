#!/bin/bash

echo Will register Akina!

dbPrompt=$(cat ../.dbPrompt.txt)
dbName=$(cat ../.dbName.txt)

body='{
	"name":     "Akina Nakamori",
	"CPF":      "01234567890",
	"email":    "akina@jpop.co.jp",
	"password": "Akina1*pass"
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/person/register/admin | jq
echo ""

# echo Altering DB to confirm email...
# $dbPrompt 'UPDATE Users SET isEmailConfirmed=1 WHERE fullName="Akina Nakamori"' $dbName

echo Done!
