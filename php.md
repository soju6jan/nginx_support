# php #

php 모듈은 nginx 플러그인 설치시 같이 설치됩니다.

기본적인 모듈은 같이 설치되어 있고 [phpinfo.php](/www/phpinfo.php)에서 확인 가능하며 추가로 필요한 모듈은 ssh에서 ```apk add 모듈명``` 명령으로 설치할 수 있습니다.

php 프로그램들은 ```/app/data/www``` 하위 폴더에 위치해야하며 ```nginx.conf```는 따로 설정할 필요없이 ```/www/프로그램명/index.php``` 로 접속이 됩니다. 

subpath를 설정할 필요가 없기 때문에 php 프로그램이 가장 확장하기 좋습니다.


-----
# myComix

imurRoid 님이 만드신 최고의 만화뷰어

<img src="https://cdn.discordapp.com/attachments/631112094015815681/762294271205179422/unknown.png" width="31%" height="30%" title="myComix" alt="myComix"></img>
<img src="https://cdn.discordapp.com/attachments/631112094015815681/762309161752854538/unknown.png" width="55%" height="100%" title="myComix" alt="myComix"></img>



◼ [자동 설치](/nginx/normal/install?title=myComix&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/php/myComix.sh)

◼ 접속 URL : [/www/myComix/index.php](/www/myComix/index.php)

◼ 홈페이지 : [마이코믹스 만화뷰어 0.17 업데이트](https://sjva.me/bbs/board.php?bo_table=tip&wr_id=1916)

◼ 설치명령
```
cd /app/data/nginx/www
git clone https://github.com/imueRoid/myComix --depth 1
chmod 777 -R /app/data/nginx/www/myComix
```

-----
# KodExplorer #

파일매니저 프로그램

<img src="https://raw.githubusercontent.com/kalcaddle/static/master/images/kod/common2.png"></img>


◼ [자동 설치](/nginx/normal/install?title=KodExplorer&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/php/KodExplorer.sh)

◼ 접속 URL : [/www/KodExplorer/index.php](/www/KodExplorer/index.php)

◼ 홈페이지 : [KodExplorer](https://github.com/kalcaddle/KodExplorer)

◼ 설치명령
```
#!/bin/sh
cd /app/data/nginx/www
git clone https://github.com/kalcaddle/KodExplorer --depth 1
chmod 777 -R /app/data/nginx/www/KodExplorer
cat <<EOF >/app/data/nginx/www/KodExplorer/config/define.php
<?php define ('DATA_PATH', '/app/data/nginx/www/KodExplorer/data/');
EOF
```

설치시 기본 데이터 폴더는 ```/app/data/nginx/www/KodExplorer/data/```가 됩니다.

필요한 폴더는 아래 ```ln``` 명령과 같이 링크롤 통해 사용하시면 됩니다.

```
ln -s /app/data /app/data/nginx/www/KodExplorer/data/Group/public/home/share/sjva_data
ln -s /host /app/data/nginx/www/KodExplorer/data/Group/public/home/share/host
ln -s /mnt /app/data/nginx/www/KodExplorer/data/Group/public/home/share/mnt
chmod 777 -R /app/data/nginx/www/KodExplorer
```


![](https://cdn.discordapp.com/attachments/631112094015815681/762329491971768340/unknown.png)


-----
# Organizr #

대쉬보드 프로그램

<img src="https://user-images.githubusercontent.com/16184466/53615856-35cc5a80-3b9d-11e9-8428-1f2ae05da2c9.png"></img>


◼ [자동 설치](/nginx/normal/install?title=Organizr&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/php/Organizr.sh)

◼ 접속 URL : [/www/Organizr/index.php](/www/Organizr/index.php)

◼ 홈페이지 : [Organizr](https://github.com/causefx/Organizr)

◼ 설치명령
```
cd /app/data/nginx/www
git clone https://github.com/causefx/Organizr --depth 1
chmod 777 -R /app/data/nginx/www/Organizr
```

-----
# LibreSpeed #

인터넷 속도 측정 프로그램

<img src="https://camo.githubusercontent.com/388774d2dbb7f7d3377918c359beb644a2809632/68747470733a2f2f7370656564746573742e66646f7373656e612e636f6d2f6d706f745f76362e676966"></img>


◼ [자동 설치](/nginx/normal/install?title=speedtest&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/php/speedtest.sh)

◼ 접속 URL : [/www/speedtest/example-singleServer-full.html](/www/speedtest/example-singleServer-full.html)

◼ 홈페이지 : [LibreSpeed speedtest](https://github.com/librespeed/speedtest)

◼ 설치명령
```
#!/bin/sh
cd /app/data/nginx/www
git clone https://github.com/librespeed/speedtest
chmod 777 -R /app/data/nginx/www/speedtest
```

-----
# RompR #
MPD 클라이언트

◼ 홈페이지 : [RompR](https://github.com/fatg3erman/RompR)

