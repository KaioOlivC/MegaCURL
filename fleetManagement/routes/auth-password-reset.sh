#!/bin/bash

echo "Will reset Kaio's password with the email token"
read -p "Input the email token: " token

body='{ "newPassword": "NewPassword" }'

curl -X PUT \
    -H "Content-Type: application/json" \
    -d "$body" \
    "localhost:3000/auth/password/reset/$token" | jq
echo ""

echo Done!
