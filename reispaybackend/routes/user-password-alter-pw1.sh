#!/bin/bash

echo Will edit the password!
token=$(cat .token.txt)

curl -X POST \
    -H "token: $token" \
    -d "oldPassword=Akina2*Pass" \
    -d "password=Akina1*Pass" \
    localhost:3000/user/alterPassword
echo ""
echo Done!
