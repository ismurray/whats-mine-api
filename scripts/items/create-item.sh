#!/bin/bash
TOKEN="BAhJIiU5ODdkNjgwNDY1ZjYzZmYzMjEzMWM4NDA3ZjQ0OTU0ZAY6BkVG--988459a789b944394202874766347f832cc86560"
NAME=user2shit
VALUE=

curl "http://localhost:4741/items" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "item": {
      "name": "'"${NAME}"'",
      "value": "'"${VALUE}"'"
    }
  }'

echo
