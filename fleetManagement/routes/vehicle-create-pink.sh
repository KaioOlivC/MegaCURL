#!/bin/bash

echo Will add a pink Toyota Corolla!
token=$(cat .token.txt)

body='{
	"licensePlate":    "JKX1981",
	"brandAndModel":   "Toyota Corolla XRS 2.0 Flex 16V Aut.",
	"year":            2013,
	"RENAVAM":         "41079234957",
	"VINNumber":       "9S63K5C639VT6355T",
	"state":           "BA",
	"ownerName":       "Rents Co.",
	"ownerCNPJ":       "98787341000153",
	"IPVAPrice":       500.00,
	"CRLVPrice":       399.90,
    "colorInDocument": "Rosa Choque",
	"details":         "A B C"
}'

response=$(
curl -X POST \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/vehicle | jq
)
echo $response | jq

token=$(echo $response | jq -r ".data.id")
if [ $token != "null" ]; then
    echo Saving vehicle id...
    echo $token > .vehicleId.txt
fi

echo Done!
