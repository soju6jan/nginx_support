#!/bin/sh
cd /app/data/nginx/www
git clone https://github.com/kalcaddle/KodExplorer --depth 1
chmod 777 -R /app/data/nginx/www/KodExplorer
cat <<EOF >/app/data/nginx/www/KodExplorer/config/define.php
<?php define ('DATA_PATH', '/app/data/nginx/www/KodExplorer/data/');
EOF