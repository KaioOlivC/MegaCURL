#!/bin/bash

echo "Will edit Akina's password"
token=$(cat .token.txt)

body='{ 
    "oldPassword": "Akina1*pass",
    "newPassword": "AkinaEditedPassword" 
}'

curl -X PUT \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/auth/password/edit | jq
echo ""

echo Done!
