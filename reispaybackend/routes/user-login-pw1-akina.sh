#!/bin/bash

echo Will login Akina!

body='{
    "identifier": "akina@jpop.co.jp",
    "password":   "Akina1*Pass"
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
    echo $token > .token.txt
fi

echo Done!
