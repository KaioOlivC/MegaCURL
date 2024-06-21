#!/bin/bash

echo Will create a new settlement
token=$(cat .akinaToken.txt)

body='{
    "defendantLawyersList": [
        {
            "name":        "Akina Nakamori",
			"phoneNumber": "71987654321",
            "CPFOrCNPJ":   "01234567890",
            "email":       "akina@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0000",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Yoshie Kashiwabara",
			"phoneNumber": "71987654322",
            "CPFOrCNPJ":   "01234567891",
            "email":       "yoshie@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0001",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Pink Studios Co.",
			"phoneNumber": "71987654323",
            "tradeName":   "Pink",
            "CPFOrCNPJ":   "00001234567890",
			"email":       "pink@jpop.co.jp"
        }
    ],
    "plaintiffLawyersList": [
        {
            "name":        "Youko Oginome",
			"phoneNumber": "71987654324",
            "CPFOrCNPJ":   "01234567892",
            "email":       "yohko@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0002",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Chisato Moritaka",
			"phoneNumber": "71987654325",
            "CPFOrCNPJ":   "01234567893",
            "email":       "chisato@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0003",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Yellow Studios Co.",
			"phoneNumber": "71987654326",
            "tradeName":   "Yellow",
            "CPFOrCNPJ":   "00001234567891",
			"email":       "yellow@jpop.co.jp"
        }
    ],
    "defendantLitigantsList": [
        {
            "name":        "Youko Minamino",
			"phoneNumber": "71987654327",
            "CPFOrCNPJ":   "01234567894",
            "email":       "nanno@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0004",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Tomoyo Harada",
			"phoneNumber": "71987654328",
            "CPFOrCNPJ":   "01234567895",
            "email":       "tomoyo@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0005",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Blue Studios Co.",
			"phoneNumber": "71987654329",
            "tradeName":   "Blue",
            "CPFOrCNPJ":   "00001234567892",
			"email":       "blue@jpop.co.jp"
        }
    ],
    "plaintiffLitigantsList": [
        {
            "name":        "Junko Yagami",
			"phoneNumber": "71987654310",
            "CPFOrCNPJ":   "01234567896",
            "email":       "junko@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0006",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Meiko Nakahara",
			"phoneNumber": "71987654311",
            "CPFOrCNPJ":   "01234567897",
            "email":       "meiko@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0007",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "White Studios Co.",
			"phoneNumber": "71987654312",
            "tradeName":   "White",
            "CPFOrCNPJ":   "00001234567893",
			"email":       "white@jpop.co.jp"
        }
    ],
    "mediatorLitigantsList": [
        {
            "name":        "Momoe Yamaguchi",
			"phoneNumber": "71987654313",
            "CPFOrCNPJ":   "01234567898",
            "email":       "momoe@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0008",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Mai Yamane",
			"phoneNumber": "71987654314",
            "CPFOrCNPJ":   "01234567899",
            "email":       "mai@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0009",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Black Studios Co.",
			"phoneNumber": "71987654315",
            "tradeName":   "Black",
            "CPFOrCNPJ":   "00001234567894",
			"email":       "black@jpop.co.jp"
        }
    ],
    "mediatorLawyersList": [
        {
            "name":        "Minako Honda",
			"phoneNumber": "71987654316",
            "CPFOrCNPJ":   "01234567800",
            "email":       "minako@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0010",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Tsubasa Itou",
			"phoneNumber": "71987654317",
            "CPFOrCNPJ":   "01234567801",
            "email":       "tsubasa@jpop.co.jp",
            "lawyerLicenseInfos": [
                {
                    "OABNumber": "0011",
                    "state":     "BA"
                }
            ]
        },
        {
            "name":        "Purple Studios Co.",
			"phoneNumber": "71987654318",
            "tradeName":   "Purple",
            "CPFOrCNPJ":   "00001234567895",
			"email":       "purple@jpop.co.jp"
        }
    ],
    "disputeData": {
        "class":       "Law class",
        "forum":       "Law forum",
        "funds":       10000.00,
        "institution": "Judicial Institution",
        "matters":     "Music",
        "number":      "12345678901234567890",
        "tribune":     "Legal Tribune"
    }
}'

response=$(
    curl -X POST \
    -H "token: $token" \
    -H "Content-Type: application/json" \
    -d "$body" \
    localhost:3000/settlement/create
)
echo $response | jq

settlementId=$(echo $response | jq -r ".data.id")
if [ $settlementId != "null" ]; then
    echo Saving settlement id...
    echo $settlementId > .lastSettlementId.txt

    # Get conversation by settlement id
    echo Obtaining this settlement\'s coversaton id...

    response=$(
        curl -X GET \
        -H "token: $token" \
        -H "Content-Type: application/json" \
        localhost:3000/chat/conversation/$settlementId
    )
    echo $response

    conversationId=$(echo $response | jq -r ".data.id")
    if [ $conversationId != 'null' ]; then
        echo Saving conversation\'s id...
        echo $conversationId > .lastConversationId.txt
    fi
fi

echo Done!
