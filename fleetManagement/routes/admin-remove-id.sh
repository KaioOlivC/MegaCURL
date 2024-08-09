#!/bin/bash

echo Will remove the admin from input!
token=$(cat .token.txt)
read -p "Type in the person id: " personId

curl -X DELETE \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/admin/$personId | jq
echo ""

echo Done!
