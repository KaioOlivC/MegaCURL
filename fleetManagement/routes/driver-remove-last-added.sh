#!/bin/bash

echo Will remove the last added driver
token=$(cat .token.txt)
driverId=$(cat .driverId.txt)

curl -X DELETE \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    "localhost:3000/driver/$driverId" | jq
echo ""

echo Done!
