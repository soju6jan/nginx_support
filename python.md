# webssh #

웹 SSH client

이 분야의 끝판왕은 guacamole 이지만 RDP, VNC 까지 지원하다보니 무겁습니다.

webssh는 가벼운 웹 SSH 클라이언트로 간단히 접속이 필요한 경우에 사용하기 좋습니다.

SJVA 도커내에 ssh server를 설치하면 호스트에 접속해서 ```docker exec -it sjva /bin/sh```과 같은 명령을 쳐서 도커내에 진입할 필요가 없이 웹에서 간단히 shell에 접속할 수 있습니다. 

설치시 오래 걸립니다.


◼ [설치](/nginx/normal/install?title=webssh&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/python/webssh.sh&arg=install)

◼ 접속 URL : [/webssh/](/webssh/)

◼ [홈페이지](https://github.com/huashengdun/webssh)

◼ 스크립트
```
#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    pip install --upgrade pip setuptools
    apk add gcc g++ make libffi-dev openssl-dev
    pip install webssh
    wget -O /usr/local/lib/python2.7/site-packages/webssh/static/css/fonts/D2Coding.ttf https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/python/D2Coding.ttf
elif [ "$1" == "install_sshd" ]; then
    apk add openssh
    sed -i 's/#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config 
    sed -i 's/prohibit-password/yes/' /etc/ssh/sshd_config 
    sed -i 's/#PermitEmptyPasswords/PermitEmptyPasswords/' /etc/ssh/sshd_config
    ssh-keygen -b 2048 -t rsa -f /root/.ssh/id_rsa -q -N ""
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
else
fi
```

◼ 실행 예
```
wssh --font=D2Coding.ttf --origin=* --debug --timeout=600
```

◼ conf
```
location /tautulli/ {
    proxy_pass http://127.0.0.1:8181/tautulli/;
    proxy_set_header Host $http_host;            
    proxy_set_header X-Real-IP  $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```

◼ [SJVA도커에 ssh server 설치](/nginx/normal/install?title=sshd&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/python/webssh.sh&arg=install_sshd)


◼ ssh-server 실행
```
/usr/sbin/sshd -h ~/.ssh/authorized_keys
```




# Tautulli #

Plex 모니터링

설치 후 

```python /app/data/nginx/python/tautulli/Tautulli/Tautulli.py --datadir /app/data/nginx/python/tautulli/data```

바로 한번 실행하고 종료하면 ```/app/data/nginx/python/tautulli/data``` 폴더에 디폴트 파일들이 만들어 집니다. 

subpath 설정을 위해 이 폴더에 있는 ```config.ini```을 열어서 ```http_root = tautulli``` 로 root를 설정해야합니다.

기존에 사용하는 DB 파일이 있다면 이 폴더에 복사하면 됩니다.


◼ [설치](/nginx/normal/install?title=Tautulli&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/python/tautulli.sh&arg=install)

◼ 접속 URL : [/tautulli/](/tautulli/)

◼ [홈페이지](https://tautulli.com/)

◼ 스크립트
```
#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    mkdir -p /app/data/nginx/python/tautulli
    mkdir -p /app/data/nginx/python/tautulli/data
    cd /app/data/nginx/python/tautulli
    git clone https://github.com/Tautulli/Tautulli
    chmod 777 -R /app/data/nginx/python/tautulli
else
fi
```

◼ 실행 예
```
python /app/data/nginx/python/tautulli/Tautulli/Tautulli.py --datadir /app/data/nginx/python/tautulli/data
```

◼ conf
```
location /tautulli/ {
    proxy_pass http://127.0.0.1:8181/tautulli/;
    proxy_set_header Host $http_host;            
    proxy_set_header X-Real-IP  $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```


# Calibre-web #

Calibre 웹 클라이언트


◼ [설치](/nginx/normal/install?title=calibre&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/python/calibre.sh&arg=install)

◼ 접속 URL : [/calibre](/calibre)

◼ [홈페이지](https://github.com/janeczku/calibre-web)

◼ 스크립트
```
#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    mkdir -p /app/data/nginx/python/calibre-web
    mkdir -p /app/data/nginx/python/calibre-web/data
    cd /app/data/nginx/python/calibre-web
    git clone https://github.com/janeczku/calibre-web
    chmod 777 -R /app/data/nginx/python/calibre-web
    cd /app/data/nginx/python/calibre-web/calibre-web
    pip install --target vendor -r requirements.txt
    #python /app/data/nginx/python/calibre-web/calibre-web/cps.py
else
fi
```

◼ 실행 예
```
python /app/data/nginx/python/calibre-web/calibre-web/cps.py
```

◼ conf
```
location /calibre {
    proxy_pass http://127.0.0.1:8083;
    proxy_set_header Host $http_host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Scheme $scheme;
    proxy_set_header X-Script-Name /calibre;
}
```




