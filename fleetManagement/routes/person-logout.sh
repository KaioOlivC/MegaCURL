#!/bin/bash

echo Will logout the current token\'s user!
token=$(cat .token.txt)

curl -s -X GET \
    -H "token: $token" \
    localhost:3000/person/logout | jq

echo ""
echo Deleting token...
rm .token.txt

echo Done!
