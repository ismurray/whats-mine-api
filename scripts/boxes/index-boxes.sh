#!/bin/bash
TOKEN="BAhJIiU1NzdiZDAxNTlkMDEzYWI2MmNlNDdjMDQ1ZDgyNzQxMAY6BkVG--990044853727e3856e7b2430417d7366b8a33d75"

curl "http://localhost:4741/boxes" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
