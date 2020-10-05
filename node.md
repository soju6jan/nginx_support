# Node.js #

◼ [라이브러리 설치](/nginx/normal/install?title=Node.js&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/nodejs/module_node.sh&arg=install) / [라이브러리 삭제](/nginx/normal/install?title=Node.js&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/nodejs/module_node_uninstall.sh&arg=uninstall)
```
#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    cd /app/data/nginx/nodejs
    git clone https://github.com/IrosTheBeggar/mStream.git
    cd mStream
    git checkout relative-urls
    npm install
    npm link
else
    ps -eo pid,args | grep mstream | grep -v grep | awk '{print $1}' | xargs -r kill -9
    npm install mstream
fi
```


최근 웹앱은 Node.js 기반으로 제작되는 경우가 많습니다.

웹앱 자체에서 subpath를 지원해야 연결할 수 있으며, command 플러그인을 이용하여 바이너리를 먼저 실행해야 합니다.

현재 설치되는 버전입니다.

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


◼ [설치](/nginx/normal/install?title=mStream&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/nodejs/mStream.sh&arg=install) / [삭제](/nginx/normal/install?title=myComix&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/nodejs/mStream.sh&arg=uninstall)

◼ 접속 URL : [/mstrem/](/mstrem/)

◼ 홈페이지 : [mstream.io](https://www.mstream.io/)

◼ 스크립트
```
#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    cd /app/data/nginx/nodejs
    git clone https://github.com/silverwind/droppy
    cd droppy
    npm install
    npm link
else
    ps -eo pid,args | grep droppy | grep -v grep | awk '{print $1}' | xargs -r kill -9
    npm uninstall droppy
fi
```

◼ 실행 예
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


-----
# droppy

파일 서버

◼ [설치](/nginx/normal/install?title=droppy&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/nodejs/droppy.sh&arg=install) / [삭제](/nginx/normal/install?title=myComix&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/nodejs/droppy.sh&arg=uninstall)

◼ 접속 URL : [/droppy/](/droppy/)

◼ 홈페이지 : [github](https://github.com/silverwind/droppy)

◼ 스크립트
```
#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    cd /app/data/nginx/nodejs
    git clone https://github.com/silverwind/droppy
    cd droppy
    npm install
    npm link
    mkdir -p /app/data/nginx/nodejs/droppy/config
    echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf
    sysctl -p
    chmod 777 -R /app/data/nginx/nodejs/droppy
else
    ps -eo pid,args | grep droppy | grep -v grep | awk '{print $1}' | xargs -r kill -9
    npm uninstall droppy
fi
```

◼ 실행 예
```
droppy start -f /app/data -c /app/data/nginx/nodejs/droppy/config
```

◼ conf
```
location /droppy/ {
    rewrite /droppy/(.*)$ /$1 break;
    proxy_pass http://127.0.0.1:8989/;
    proxy_redirect off;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
}
```







