#!/bin/bash

echo "Will remove the logged in admin's own data!"
token=$(cat .token.txt)

curl -X DELETE \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/admin | jq
echo ""

echo Done!
