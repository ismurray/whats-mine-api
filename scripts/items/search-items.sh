#!/bin/bash
TOKEN="BAhJIiU0YTg0ZmY2ZDc5OWQxNzI4OGNlZDI5ZWE4MjljMGUzMQY6BkVG--a894d8324be09b2e51a19235537d42b8ac8ce56a"
SEARCH='hi'

curl "http://localhost:4741/items?search=${SEARCH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
