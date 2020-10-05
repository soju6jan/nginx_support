#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    mkdir -p /app/data/nginx/go/xTeVe
    cd /app/data/nginx/go/xTeVe
    wget  -O xteve_linux_amd64.zip https://github.com/xteve-project/xTeVe-Downloads/blob/master/xteve_linux_amd64.zip?raw=true
    unzip xteve_linux_amd64.zip
    rm -rf xteve_linux_amd64.zip
    chmod 777 xteve
    ln -s /app/data/nginx/go/xTeVe/xteve /usr/bin/xteve
else
    
fi
