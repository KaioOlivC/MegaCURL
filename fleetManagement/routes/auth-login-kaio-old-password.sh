#!/bin/bash

echo Will login Kaio!

body='{
	"email":    "kaio.oliv.carvalho@gmail.com",
	"password": "OldPassword"
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
