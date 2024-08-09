#!/bin/bash

echo Will edit Chisato into Akina!
token=$(cat .token.txt)

body='{
	"name":  "Akina Nakamori",
	"email": "akina@jpop.co.jp"
}'

curl -X PUT \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/admin | jq
echo ""

echo Done!
