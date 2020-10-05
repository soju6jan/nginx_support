#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    cd /app/data/nginx/nodejs
    git clone https://github.com/IrosTheBeggar/mStream.git
    cd mStream
    git checkout relative-urls
    npm install
    npm link
else
    npm install mstream
fi