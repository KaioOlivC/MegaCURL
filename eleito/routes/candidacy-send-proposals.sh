#!/bin/bash

echo Will register Akina\'s proposals to her candidacy!
leaderToken=$(cat .token.txt)

curl -X POST \
    -H "token: $leaderToken" \
    -H "Content-Type: multipart/form-data" \
    -F "proposals=@akina-bikini.jpg" \
    localhost:3000/candidate/register-files/proposals | jq
echo ""
echo Done!
