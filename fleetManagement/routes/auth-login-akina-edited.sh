#!/bin/bash

echo Will login Akina!

body='{
	"email":    "akina@jpop.co.jp",
	"password": "AkinaEditedPassword"
}'

response=$(
    curl -s -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/auth/login
)
echo $response | jq

token=$(echo $response | jq -r ".data.token")
if [ $token != "null" ]; then
    echo Saving token...
    echo $token > .token.txt
fi

echo Done!
