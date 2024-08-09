#!/bin/bash

echo Will get the last added vehicle
token=$(cat .token.txt)
vehicleId=$(cat .vehicleId.txt)

curl -X GET \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    "localhost:3000/vehicle/$vehicleId" | jq
echo ""

echo Done!
