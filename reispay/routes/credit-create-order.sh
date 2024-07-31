#!/bin/bash

echo Will try a purchase with a good credit card

body='{
    "callbackURL":  "http://192.168.15.4:3000/payment/webhook/creditCard/mypaymentid",
    "externalId":   "Payment ID",
    "cardDescription":  "Akina-chan bikini poster",
    "installments": 2,
    "value":        50000,
    "customer": {
        "name":           "Miho Morikawa",
        "documentNumber": "25901431251"
    },
    "card": {
        "number":              "4761120000000148",
        "expirationMonth":     "06",
        "expirationYear":      "2026",
        "securityCode":        "123",
        "ownerName":           "Miho Morikawa",
        "ownerDocumentNumber": "25901431251"
    }
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3001/credit/depositOrder | jq
echo ""
echo Done!
