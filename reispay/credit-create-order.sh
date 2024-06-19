#!/bin/bash

echo Will try a purchase with a good credit card

body='{
    "description": "Akina-chan bikini poster",
    "value": 50000,
    "callbackURL": "localhost:3000/payment/webhook/test",
    "customer": {
        "name": "Miho Morikawa",
        "documentNumber": "25901431251"
    },
    "installments": 2,
    "card": {
        "number": "4761120000000148",
        "expirationMonth": "06",
        "expirationYear": "2026",
        "securityCode": "124",
        "ownerName": "Miho Morikawa",
        "ownerDocumentNumber": "25901431251"
    },
    "externalId": "Payment ID"
}'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3001/credit/depositOrder | jq
echo ""
echo Done!
