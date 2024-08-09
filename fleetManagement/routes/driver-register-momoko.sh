#!/bin/bash

echo Will register Momoko to drive!
token=$(cat .token.txt)

body='{
	"name":         "Momoko Kikuchi",
	"CPF":          "09876543210",
    "employeeCode": "My favorite cruise driver",
    "CNHData": {
        "number":       "01234567890",
        "hasCategoryB": true,
        "emittedAt":    "2025-07-07",
        "expiresAt":    "2020-07-07"
    },
    "intoxicationTestData": {
        "intoxicationTestMadeAt":    "2023-11-11",
        "intoxicationTestExpiresAt": "2025-11-11"
    }
}'

response=$(curl -X POST \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/driver
)
echo $response | jq

token=$(echo $response | jq -r ".data.personId")
if [ $token!="null" ]; then
    echo Saving driver id...
    echo $token > .driverId.txt
fi

echo Done!
