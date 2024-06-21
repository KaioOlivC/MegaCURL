#!/bin/bash

echo Will register Akina!

dbPrompt=$(cat ../.dbPrompt.txt)
dbName=$(cat ../.dbName.txt)

body='{
	"fullName":           "Akina Nakamori",
	"CPF":                "01234567890",
	"email":              "akina@jpop.co.jp",
	"password":           "Akina1*pass",
	"confirmPassword":    "Akina1*pass",
	"phoneNumber":        "71987654321",
    "additionalDetails":  "Pink building, Ap. 17",
    "city":               "Salvador",
    "neighborhood":       "Imbuí",
    "number":             "1",
    "thoroughfare":       "Pink",
    "zipCode":            "12345678",
    "state":              "BA",
    "lawyerLicenseInfos": [
        {
            "OABNumber": "0000",
            "state":     "BA"
        }
    ]
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/user/lawyer/register | jq
echo ""

echo Altering DB to confirm email...
$dbPrompt 'UPDATE Users SET isEmailConfirmed=1 WHERE fullName="Akina Nakamori"' $dbName

echo Done!
