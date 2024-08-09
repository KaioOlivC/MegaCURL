#!/bin/bash

echo Will edit Momoko!
token=$(cat .token.txt)
driverId=$(cat .driverId.txt)

body='{
    "id":           "'$driverId'",
	"name":         "Momoko Kikuchi Taisan",
    "employeeCode": "Upgraded to destroyer pilot",
    "CNHData": {
        "number":       "01234567890",
        "hasCategoryB": true,
        "hasCategoryE": false,
        "emittedAt":    "2025-07-07",
        "expiresAt":    "2020-07-07"
    },
    "intoxicationTestData": {
        "intoxicationTestMadeAt":    "2023-11-11",
        "intoxicationTestExpiresAt": "2025-11-11"
    }
}'

curl -X PUT \
    -H "Content-Type: application/json" \
    -H "token: $token" \
    -d "$body" \
    localhost:3000/driver | jq
echo ""

echo Done!


