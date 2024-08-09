#!/bin/bash

echo Will get all the admins!
token=$(cat .token.txt)

curl -X GET \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/admin/all | jq
echo ""

echo Done!
