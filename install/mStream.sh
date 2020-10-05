#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    cd /app/data/nginx/nodejs
    git clone https://github.com/silverwind/droppy
    cd droppy
    npm install
    npm link
else
    ps -eo pid,args | grep droppy | grep -v grep | awk '{print $1}' | xargs -r kill -9
    npm uninstall droppy
fi