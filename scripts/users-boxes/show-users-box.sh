#!/bin/bash
TOKEN="BAhJIiUyNzdkZDI2ZjdiMDdlYjgzOWZlMmNmODJmOTJmNjMyYgY6BkVG--107093650851f5d4e686b0e2be351d00c6e4950a"
ID=3

curl "http://localhost:4741/users_boxes/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
