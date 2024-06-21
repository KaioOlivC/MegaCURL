#!/bin/bash

echo Will login Tsubasa!

body='{
	"identifier": "tsubasa@jpop.co.jp",
	"password":   "Akina1*pass"
}'

response=$(
    curl -s -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/user/login
)
echo $response

token=$(echo $response | jq -r ".token")
if [ $token != "null" ]; then
    echo Saving token...
    echo $token > .tsubasaToken.txt
fi

echo Done!
