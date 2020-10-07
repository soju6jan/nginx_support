#!/bin/sh
cd /app/data/nginx/www
git clone https://github.com/ziahamza/webui-aria2 --depth 1
chmod 777 -R /app/data/nginx/www/webui-aria2
