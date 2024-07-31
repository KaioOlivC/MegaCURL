#!/bin/bash

echo Will initialize TSE data!

curl -X GET \
    localhost:3000/system/autofill| jq
echo ""
echo Done!
