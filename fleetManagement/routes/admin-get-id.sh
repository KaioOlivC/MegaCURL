#!/bin/bash

echo Will get the admin from input!
token=$(cat .token.txt)
read -p "Type in the person id: " personId

curl -X GET \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/admin/byId/$personId | jq
echo ""

echo Done!
