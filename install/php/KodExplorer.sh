#!/bin/sh
cd /app/data/nginx/www
git clone https://github.com/kalcaddle/KodExplorer
chmod 777 -R /app/data/nginx/www/KodExplorer
ln -s /app/data /app/data/nginx/www/KodExplorer/data/Group/public/home/share/sjva_data
ln -s /host /app/data/nginx/www/KodExplorer/data/Group/public/home/share/host
ln -s /mnt /app/data/nginx/www/KodExplorer/data/Group/public/home/share/mnt
cat <<EOF >/app/data/nginx/www/KodExplorer/config/define.php
<?php define ('DATA_PATH', '/app/data/nginx/www/KodExplorer/data/');
EOF