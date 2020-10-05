#!/bin/sh
if [ "$#" -lt 1 ] || ["$1" == "install" ] ; then
  mkdir -p /app/data/nginx/nodejs
  apk update
  apk upgrade
  apk add nodejs npm
else
  apk del nodejs npm
fi
