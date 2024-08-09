#!/bin/bash

echo "Will undo the edit on Akina's password"
token=$(cat .token.txt)

body='{ 
    "oldPassword": "AkinaEditedPassword",
    "newPassword": "Akina1*pass" 
}'

curl -X PUT \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/auth/password/edit | jq
echo ""

echo Done!
