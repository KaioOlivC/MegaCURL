#!/bin/bash

echo Will register Akina!

body='{
	"birthday": "1965-07-13",
	"CPF": "01234567890",
	"email": "akina@jpop.co.jp",
	"firstName": "Akina",
	"lastName": "Nakamori",
	"phone": "987654321",
	"password": "Akina1*pass",
	"fourDigitPin": "1234",
    "address": {
        "additionalDetails": "Pink Tower",
        "city": "Salvador",
        "neighborhood": "Brotas",
        "number": "1",
        "referencePoints": "Near Akinas Studio",
        "thoroughfare": "Pink",
        "zipCode": "41720003",
        "state": "BA",
        "thoroughfareType": "Rua"
    }
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/user/register
echo ""
echo Done!
