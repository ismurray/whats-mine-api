#!/bin/bash
TOKEN="BAhJIiU1NzdiZDAxNTlkMDEzYWI2MmNlNDdjMDQ1ZDgyNzQxMAY6BkVG--990044853727e3856e7b2430417d7366b8a33d75"
NAME=SecondItemInABox
VALUE=999
BOX_ID=2

curl "http://localhost:4741/items" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "value": "'"${VALUE}"'",
      "box_id": "'"${BOX_ID}"'"
    }
  }'

echo
