#!/bin/bash

echo Will register Youko O.!

dbPrompt=$(cat ../.dbPrompt.txt)
dbName=$(cat ../.dbName.txt)

body='{
	"fullName":           "Youko Oginome",
	"CPF":                "01234567892",
	"email":              "yohko@jpop.co.jp",
	"password":           "Akina1*pass",
	"confirmPassword":    "Akina1*pass",
	"phoneNumber":        "71987654324",
    "additionalDetails":  "Yellow building, Ap. 17",
    "city":               "Salvador",
    "neighborhood":       "Imbuí",
    "number":             "1",
    "thoroughfare":       "Yellow",
    "zipCode":            "12345678",
    "state":              "BA",
    "lawyerLicenseInfos": [
        {
            "OABNumber": "0002",
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
$dbPrompt 'UPDATE Users SET isEmailConfirmed=1 WHERE fullName="Youko Oginome"' $dbName

echo Done!
