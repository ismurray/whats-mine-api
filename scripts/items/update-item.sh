#!/bin/bash
NAME='OHBOIHEREWEGO'
VALUE=13000
ID=3

curl "http://localhost:4741/items/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "value": "'"${VALUE}"'"
    }
  }'

echo
