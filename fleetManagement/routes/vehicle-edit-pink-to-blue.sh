#!/bin/bash

echo Will change the last added vehicle!
token=$(cat .token.txt)
vehicleId=$(cat .vehicleId.txt)

body='{
    "id":              "'$vehicleId'",
	"licensePlate":    "DRC9D87",
	"brandAndModel":   "Toyota Corolla XRS 3.0 Flex 16V Aut.",
	"year":            2015,
    "colorInDocument": "Azul Marinho",
	"details":         "A B C D"
}'

curl -X PUT \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/vehicle | jq
echo ""

echo Done!
