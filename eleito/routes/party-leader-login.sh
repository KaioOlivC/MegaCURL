#!/bin/bash

echo Will login Su-hyang!

body='{
    "user":     "jong_su_hyang@dprk.gov.kp", 
	"password": "Akina1*pass"
}'

response=$(
    curl -s -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/party-leader/login
)
echo $response

token=$(echo $response | jq -r ".token")
if [ $token != "null" ]; then
    echo Saving token...
    echo $token > .leaderToken.txt
fi

echo Done!
