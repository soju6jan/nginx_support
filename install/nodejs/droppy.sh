#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    cd /app/data/nginx/nodejs
    git clone https://github.com/silverwind/droppy
    cd droppy
    npm install
    npm link
    mkdir -p /app/data/nginx/nodejs/droppy/config
    echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf
    sysctl -p
    chmod 777 -R /app/data/nginx/nodejs/droppy
else
    ps -eo pid,args | grep droppy | grep -v grep | awk '{print $1}' | xargs -r kill -9
    npm uninstall droppy
fi