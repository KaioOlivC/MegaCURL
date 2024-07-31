#!/bin/bash

echo Will login Akina!

body='{
	"email":    "akina@jpop.co.jp",
	"password": "Akina1*pass"
}'

response=$(
    curl -s -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/person/login
)
echo $response | jq

token=$(echo $response | jq -r ".token")
if [ $token != "null" ]; then
    echo Saving token...
    echo $token > .token.txt
fi

echo Done!
