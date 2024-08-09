#!/bin/bash

echo Will register Akina!

body='{
	"name":     "Akina Nakamori",
	"CPF":      "01234567890",
	"email":    "akina@jpop.co.jp",
	"password": "Akina1*pass"
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/admin | jq
echo ""

echo Done!
