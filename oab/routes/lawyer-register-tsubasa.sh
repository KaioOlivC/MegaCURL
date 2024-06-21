#!/bin/bash

echo Will register Tsubasa!

dbPrompt=$(cat ../.dbPrompt.txt)
dbName=$(cat ../.dbName.txt)

body='{
	"fullName":           "Tsubasa Itou",
	"CPF":                "01234567801",
	"email":              "tsubasa@jpop.co.jp",
	"password":           "Akina1*pass",
	"confirmPassword":    "Akina1*pass",
	"phoneNumber":        "71987654317",
    "additionalDetails":  "Purple building, Ap. 17",
    "city":               "Salvador",
    "neighborhood":       "Imbuí",
    "number":             "1",
    "thoroughfare":       "Purple",
    "zipCode":            "12345678",
    "state":              "BA",
    "lawyerLicenseInfos": [
        {
            "OABNumber": "0011",
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
$dbPrompt 'UPDATE Users SET isEmailConfirmed=1 WHERE fullName="Tsubasa Itou"' $dbName

echo Done!
