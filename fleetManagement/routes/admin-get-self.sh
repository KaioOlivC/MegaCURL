#!/bin/bash

echo Will get the logged in admin!
token=$(cat .token.txt)

curl -X GET \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/admin | jq
echo ""

echo Done!
