# Go #

단독 실행파일 하나로 실행됩니다.

/app/data/nginx/go/프로그램명 폴더에 실행파일이 위치하고 같은 폴더를 config 폴더로 사용합니다.

SJVA에 기본 포함된 파일브라우저가 go로 작성된 프로그램입니다.


-----
# xTeVe

PMS Proxy

subpath를 지원하지 않고 nginx 설정만으로 연결합니다.

> 웹페이지만 띄우고 실사용 테스트는 아직 못함.


◼ [설치](/nginx/normal/install?title=myComix&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/go/xTeVe.sh&arg=install)

◼ 접속 URL : [/xteve/web/](/mstrem/)

◼ [홈페이지](https://xteve.de/)

◼ 스크립트
```
#!/bin/sh
if [ "$#" -lt 1 ] || [ "$1" == "install" ] ; then
    mkdir -p /app/data/nginx/go/xTeVe
    cd /app/data/nginx/go/xTeVe
    wget  -O xteve_linux_amd64.zip https://github.com/xteve-project/xTeVe-Downloads/blob/master/xteve_linux_amd64.zip?raw=true
    unzip xteve_linux_amd64.zip
    rm -rf xteve_linux_amd64.zip
    chmod 777 xteve
    ln -s /app/data/nginx/go/xTeVe/xteve /usr/bin/xteve
else
    echo 'uninstall'
fi

```

◼ 실행 예
```
xteve -config /app/data/nginx/go/xTeVe/
```

◼ conf
```
location /xteve/ {
    sub_filter_types application/javascript;
    sub_filter 'window.location.port + "/data/"' 'window.location.port + "/xteve/data/"';
    sub_filter_once on;
    proxy_cookie_path / /xteve/;
    proxy_redirect / /xteve/;
    proxy_pass http://127.0.0.1:34400/;
    rewrite ^/xteve(.*) $1 break;          

    proxy_set_header X-Real-IP          $remote_addr;
    proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
    proxy_set_header Upgrade            $http_upgrade;
    proxy_set_header Connection         "Upgrade";
}
```



