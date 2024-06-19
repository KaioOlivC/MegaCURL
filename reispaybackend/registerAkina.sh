#!/bin/bash

echo Will register Akina!

body='{
	"birthday":     "1965-07-13",
	"CPF":          "01234567890",
	"email":        "akina@jpop.co.jp",
	"firstName":    "Akina",
	"fourDigitPin": "1234",
	"lastName":     "Nakamori",
	"password":     "Akina1*pass",
	"phone":        "987654321",
    "address":      {
        "additionalDetails": "Pink Tower",
        "city":              "Salvador",
        "neighborhood":      "Brotas",
        "number":            "1",
        "referencePoints":   "Near Akinas Studio",
        "state":             "BA",
        "thoroughfare":      "Pink",
        "thoroughfareType":  "Rua",
        "zipCode":           "41720003"
    }
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/user/register
echo ""
echo Done!
