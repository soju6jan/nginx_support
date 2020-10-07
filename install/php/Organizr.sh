#!/bin/sh
cd /app/data/nginx/www
git clone https://github.com/causefx/Organizr --depth 1
chmod 777 -R /app/data/nginx/www/Organizr