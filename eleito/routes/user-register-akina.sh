#!/bin/bash

echo Will register Akina!

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
echo Done!
