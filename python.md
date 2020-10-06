# Tautulli #

Plex 모니터링

설치 후 

```python /app/data/nginx/python/tautulli/Tautulli/Tautulli.py --datadir /app/data/nginx/python/tautulli/data```

바로 한번 실행하고 종료하면 ```/app/data/nginx/python/tautulli/data``` 폴더에 디폴트 파일들이 만들어 집니다. 

subpath 설정을 위해 이 폴더에 있는 ```config.ini```을 열어서 ```http_root = tautulli``` 로 root를 설정해야합니다.

기존에 사용하는 DB 파일이 있다면 이 폴더에 복사하면 됩니다.


◼ [설치](/nginx/normal/install?title=myComix&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/python/tautulli.sh&arg=install)

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


◼ [설치](/nginx/normal/install?title=myComix&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/python/calibre.sh&arg=install)

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




