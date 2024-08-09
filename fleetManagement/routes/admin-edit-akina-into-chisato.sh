#!/bin/bash

echo Will edit Akina into Chisato!
token=$(cat .token.txt)

body='{
	"name":  "Chisato Moritaka",
	"email": "chisato@jpop.co.jp"
}'

curl -X PUT \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/admin | jq
echo ""

echo Done!
