#!/bin/bash
TOKEN="BAhJIiU1NzdiZDAxNTlkMDEzYWI2MmNlNDdjMDQ1ZDgyNzQxMAY6BkVG--990044853727e3856e7b2430417d7366b8a33d75"
NAME='Changed that bad boye'
ID=5

curl "http://localhost:4741/boxes/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "box": {
      "name": "'"${NAME}"'"
    }
  }'

echo
