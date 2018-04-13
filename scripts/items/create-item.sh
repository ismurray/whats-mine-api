#!/bin/bash
NAME='ewakdfjsgh'
VALUE=99999
USER_ID=1

curl "http://localhost:4741/items" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "value": "'"${VALUE}"'",
      "user_id": "'"${USER_ID}"'"
    }
  }'

echo
