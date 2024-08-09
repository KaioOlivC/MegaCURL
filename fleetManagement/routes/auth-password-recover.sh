

echo Will ask for password recovering with kaio.oliv.carvalho@gmail.com

body='{ "email": "kaio.oliv.carvalho@gmail.com" }'

curl -X POST \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/auth/password/recover | jq
echo ""

echo Done!
