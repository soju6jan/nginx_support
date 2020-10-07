#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    mkdir -p /app/data/nginx/python/tautulli
    mkdir -p /app/data/nginx/python/tautulli/data
    cd /app/data/nginx/python/tautulli
    git clone https://github.com/Tautulli/Tautulli --depth 1
    chmod 777 -R /app/data/nginx/python/tautulli
else
    echo 'uninstall'
fi