#!/bin/bash

echo Will get the pink Toyota debt report!
token=$(cat .token.txt)

body='{
	"licensePlate":    "JKX1981",
	"brandAndModel":   "Toyota Corolla XRS 2.0 Flex 16V Aut.",
	"RENAVAM":         "41079234957",
	"state":           "BA",
	"ownerName":       "Rents Co.",
	"ownerCNPJ":       "98787341000153"
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/report/vehicle | jq

echo Done!
