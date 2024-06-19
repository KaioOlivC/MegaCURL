#!/bin/bash

echo Will reset the webhook settings at the credit card API

curl -X POST \
    -H "Content-Type: application/json" \
    localhost:3001/credit/updateWebhook | jq
echo ""
echo Done!
