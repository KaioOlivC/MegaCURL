#!/bin/bash

echo Will edit Su-hyang\'s term date!
leaderToken=$(cat .leaderToken.txt)
leaderId=$(cat .leaderId.txt)

body='{
    "id":            "'$leaderId'",
    "endOfTermDate": "2028-12-31",
    "justification": "Because I felt like it",
    "jurisdiction":  "national"
}'

curl -X PUT \
    -H "token: $leaderToken" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/party-leader/edit | jq
echo ""
echo Done!
