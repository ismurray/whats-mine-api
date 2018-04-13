#!/bin/bash
ID=4

curl "http://localhost:4741/items/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
