#!/bin/sh
cd $SJVA_HOME/data/nginx/www
git clone https://github.com/ziahamza/webui-aria2 --depth 1
chmod 777 -R $SJVA_HOME/data/nginx/www/webui-aria2
