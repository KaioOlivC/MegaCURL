#!/bin/bash

echo Will register Su-hyang\'s photo!
leaderToken=$(cat .leaderToken.txt)

curl -X POST \
    -H "token: $leaderToken" \
    -H "Content-Type: multipart/form-data" \
    -F "photo=@jong-su-hyang.jpeg" \
    localhost:3000/party-leader/register-photo | jq
echo ""
echo Done!
