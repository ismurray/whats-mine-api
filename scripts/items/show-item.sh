#!/bin/bash
TOKEN="BAhJIiU1NzdiZDAxNTlkMDEzYWI2MmNlNDdjMDQ1ZDgyNzQxMAY6BkVG--990044853727e3856e7b2430417d7366b8a33d75"
ID=43

curl "http://localhost:4741/items/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
