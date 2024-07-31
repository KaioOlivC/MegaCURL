#!/bin/bash

echo Will fetch auto fill TSE data for a candidate!

curl -X GET \
    localhost:3000/autofill/candidate/47517832620 | jq
echo ""
echo Done!
