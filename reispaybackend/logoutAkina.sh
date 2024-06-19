#!/bin/bash

echo Will logout Akina!
token=$(cat .token.txt)

curl -s -X POST \
    -H "token: $token" \
    localhost:3000/user/logout

echo ""
echo Deleting token...
rm .token.txt

echo Done!
