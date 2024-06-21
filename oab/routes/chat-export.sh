#!/bin/bash

echo Will export the last chat!

token=$(cat .akinaToken.txt)
settlementId=$(cat .lastSettlementId.txt)
conversationId=$(cat .lastConversationId.txt)

curl -s -X GET \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    "localhost:3000/chat/export/$settlementId" > "test.pdf"
echo ""

firefox test.pdf
echo Done!
