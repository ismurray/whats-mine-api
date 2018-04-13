#!/bin/bash
TOKEN="BAhJIiU5ODdkNjgwNDY1ZjYzZmYzMjEzMWM4NDA3ZjQ0OTU0ZAY6BkVG--988459a789b944394202874766347f832cc86560"
NAME='Changed that bad boye'
VALUE=13000
ID=8

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
