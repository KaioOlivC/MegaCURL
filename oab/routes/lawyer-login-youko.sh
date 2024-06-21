#!/bin/bash

echo Will login Youko O.!

body='{
	"identifier": "yohko@jpop.co.jp",
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
    echo $token > .yohkoToken.txt
fi

echo Done!
