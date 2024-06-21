#!/bin/bash

echo Will send a message as Akina!
token=$(cat .akinaToken.txt)
conversationId=$(cat .lastConversationId.txt)

message=$1
echo $message

body='{
    "conversationId": "'$conversationId'",
    "message":        "'$message'"
}'

curl -s -X POST \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/chat/createMessage | jq
echo ""
echo Done!
