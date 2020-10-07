#!/bin/sh
cd /app/data/nginx/www
git clone https://github.com/librespeed/speedtest --depth 1
chmod 777 -R /app/data/nginx/www/speedtest
