#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    mkdir -p /app/data/nginx/python/calibre-web
    mkdir -p /app/data/nginx/python/calibre-web/data
    cd /app/data/nginx/python/calibre-web
    git clone https://github.com/janeczku/calibre-web
    chmod 777 -R /app/data/nginx/python/calibre-web
    cd /app/data/nginx/python/calibre-web/calibre-web
    pip install --target vendor -r requirements.txt
    #python /app/data/nginx/python/calibre-web/calibre-web/cps.py
else
    echo 'uninstall'
fi