#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    cd /app/data/nginx/nodejs
    git clone -b relative-urls --single-branch https://github.com/IrosTheBeggar/mStream.git --depth 1
    cd mStream
    npm install
    npm link
else
    ps -eo pid,args | grep mstream | grep -v grep | awk '{print $1}' | xargs -r kill -9
    npm uninstall mstream
fi