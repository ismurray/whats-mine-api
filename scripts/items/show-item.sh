#!/bin/bash
ID=1

curl "http://localhost:4741/items/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
