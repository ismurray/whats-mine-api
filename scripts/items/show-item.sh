#!/bin/bash
TOKEN="BAhJIiU5ODdkNjgwNDY1ZjYzZmYzMjEzMWM4NDA3ZjQ0OTU0ZAY6BkVG--988459a789b944394202874766347f832cc86560"
ID=1

curl "http://localhost:4741/items/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
