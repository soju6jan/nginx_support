# Node.js #

◼ [라이브러리 설치](/nginx/normal/install?title=Node.js&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/module_node.sh)
```
#!/bin/sh
mkdir -p /app/data/nginx/nodejs
apk update
apk upgrade
apk add nodejs, npm
```

◼ [라이브러리 삭제](/nginx/normal/install?title=Node.js&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/module_node_uninstall.sh)
```
#!/bin/sh
apk del nodejs, npm
```


최근 웹앱은 Node.js 기반으로 제작되는 경우가 많습니다.

웹앱 자체에서 subpath를 지원해야 연결할 수 있으며, command 플러그인을 이용하여 바이너리를 먼저 실행해야 합니다.

```
/app # node --version
v10.19.0
/app # npm --version
6.13.4
```

-----
# mStream

음악 재생

<img src="https://raw.githubusercontent.com/IrosTheBeggar/mStream/master/public/img/designs/mstreamv4.png"></img>


◼ [자동 설치](/nginx/normal/install?title=myComix&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/mstream.sh)

◼ 접속 URL : [/mstrem/](/mstrem/)

◼ 홈페이지 : [mstream.io](https://www.mstream.io/)

◼ 설치명령
```
#!/bin/sh
cd /app/data/nginx/nodejs
git clone https://github.com/IrosTheBeggar/mStream.git
cd mStream
git checkout relative-urls
npm install
npm link
```

◼ 실행
```
# Boot mStream with the config file
mstream -j /path/to/config.json

# the login system will be disabled if these values are not set
mstream -u username -x password

# set music directory
mstream -m /path/to/music
```
홈페이지에서 실행 명령에 대한 옵션을 확인한 후 command에 등록하세요.

<img src="https://cdn.discordapp.com/attachments/631112094015815681/762606741736652800/unknown.png" width="50%" height="100%"></img>




◼ conf
```
location /mstream/   {
    proxy_pass http://127.0.0.1:3000/;
}
```







Quick Test Configurations
Command line flags can be used to test different mStream configurations








-----
# Organizr #

대쉬보드 프로그램

<img src="https://user-images.githubusercontent.com/16184466/53615856-35cc5a80-3b9d-11e9-8428-1f2ae05da2c9.png"></img>


◼ [자동 설치](/nginx/normal/install?title=Organizr&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/Organizr.sh)

◼ 접속 URL : [/www/Organizr/index.php](/www/Organizr/index.php)

◼ 홈페이지 : [Organizr](https://github.com/causefx/Organizr)

◼ 설치명령
```
cd /app/data/nginx/www
git clone https://github.com/causefx/Organizr
chmod 777 -R /app/data/nginx/www/Organizr
```

-----
# KodExplorer #

파일매니저 프로그램

<img src="https://raw.githubusercontent.com/kalcaddle/static/master/images/kod/common2.png"></img>


◼ [자동 설치](/nginx/normal/install?title=KodExplorer&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/KodExplorer.sh)

◼ 접속 URL : [/www/KodExplorer/index.php](/www/KodExplorer/index.php)

◼ 홈페이지 : [KodExplorer](https://github.com/kalcaddle/KodExplorer)

◼ 설치명령
```
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
```

설치시 기본 데이터 폴더는 ```/app/data/nginx/www/KodExplorer/data/```가 되고 ```/app/data, /host, /mnt``` 폴더가  ```share```폴더 안에 링크됩니다. 필요한 폴더는 위 ```ln -s``` 명령을 참고하여 사용하면 됩니다.

![](https://cdn.discordapp.com/attachments/631112094015815681/762329491971768340/unknown.png)

-----
# LibreSpeed #

인터넷 속도 측정 프로그램

<img src="https://camo.githubusercontent.com/388774d2dbb7f7d3377918c359beb644a2809632/68747470733a2f2f7370656564746573742e66646f7373656e612e636f6d2f6d706f745f76362e676966"></img>


◼ [자동 설치](/nginx/normal/install?title=speedtest&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/speedtest.sh)

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

