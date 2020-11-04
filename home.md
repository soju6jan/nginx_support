# NGINX
1. [소개](/www/guide.php?filename=home)
2. 설치 & 적용방법
3. [기존 플러그인 변경](/www/guide.php?filename=basic)
4. 확장프로그램
   1. [php](/www/guide.php?filename=php)
   2. [Node.js](/www/guide.php?filename=node)
   3. [python](/www/guide.php?filename=python)
   4. [Go](/www/guide.php?filename=go)
   5. [Java](/www/guide.php?filename=java)
-----

# About nginx ##

> [공식 홈페이지](https://www.nginx.com/)
 
nginx는 웹 서버로 SJVA에서는 reverse proxy server 역할을 합니다.

서브 도메인도 설정은 가능하나 그건 개별적으로 설정을 하셔야하며 여기서는 서브 패스 설정만 다룹니다.


----
# 도커 실행 명령
```
docker run -d \
  --name sjva \
  -v /root/docker/sjva:/app/data \
  -v /mnt:/mnt \
  -v /:/host \
  -p 9999:9999 \
  --privileged soju6jan/sjva:0.2
```
도커 실행명령 예제입니다. 개인의 상황에 맞게 수정하여 사용하세요.

이 명령으로 도커를 만들었다는 가정하에 설명합니다.

> ```-v /:/host``` host 루트를 /host로 링크하시는 것을 추천합니다.


----
# nginx 플러그인 ##

어떤 웹앱 공개 프로그램을 실행하려고 할 때 보통 도커나 네이티브로 프로그램 실행 후 포트 하나 열고 도메인을 연결하거나 포트포워딩, cron 등록 같은 작업을 해야하는 경우가 있습니다. Plex와 같이 규모가 큰 프로그램이라면 당연히 그렇게 해야겠지만 가벼운 데몬 하나 돌릴 때에서 이런 일련의 작업을 하려면 상당히 귀찮습니다.

그런 경우를 위해 nginx 플러그인이 만들어졌고, 이 플러그인의 목표는 외부 프로그램의 간단한 설치와 subpath 설정을 통한 편한 연결 지원입니다. 예전 개별 프로그램들의 런처를 하나로 통합한다고 생각하시면 됩니다.

예를 들어 예전에는 9998 포트도 같이 열어서 ```filebrowser```를 연결했다면, 이제는 ```http://내도메인/filebrowser```와 같은 형식으로 ```filebrowser``` 연결을 할 수 있게 됩니다.

nginx 플러그인 자체는 특별한 기능은 없고 오직 설치, 삭제와 conf 파일 수정할 수 있는 기능만 있습니다. 외부 프로그램을 설치에 스크립트 설치를 지원할 수도 있고, 안 할 수도 있는데 ```docker exec -it sjva /bin/sh``` 와 같이 도커내에 진입하여 shell에서 명령을 내리는 것을 기본으로 합니다.

> 아니면 ```python``` 환경의 ```webssh```를 설치하고 도커내에서 ```sshd```을 직접 돌려서 브라우저 상에서 명령을 내리는 방법도 있으니 참고하시기 바랍니다.

nginx 설치 후에는 SJVA 재시작이 아닌 도커 재시작을 해야하며 설치시 자동적으로 ```/app/pre_start.sh``` 파일이 생성됩니다.

```
#!/bin/sh
nginx
php-fpm7 -R
```

이 파일은 도커 시작시 ```/app/start.sh``` 파일보다 먼저 실행됩니다. 

php제외한 다른 프로그램들은 어떤 방식이든 프로세스를 구동해야 하는데 SJVA command 기능을 통해 할 수도 있지만, SJVA와 상관없이 구동하고 싶다면 이 파일을 편집하여 사용하시면 됩니다. 

정상적으로 설치완료 후에는 [index.html](/www/index.html), [phpinfo.php](/www/phpinfo.php), [guide.php](/www/guide.php?filename=home) 3가지 기본 페이지 접속이 되며, 기존 9998포트를 연결했던 [File Browser](/filebrowser)가 ```/filebrowser``` 서브패스를 통해서도 접속이 됩니다.


----
# conf 파일 #

nginx의 reverse proxy server 기능을 사용하기 위해서는 conf파일을 수정할 수 있어야 합니다.

[NPM(Nginx Proxy Manager) 설치법](https://sjva.me/bbs/board.php?bo_table=manual&wr_id=176#c_630) 와 같은 프로그램은 이런 conf파일을 UI를 통하여 수정할 수 있도록 해주는 프로그램이라고 생각하시면 됩니다.

이런 conf 설정에 관한 문서가 많으니 검색해보시기 바랍니다. 




----
# 프로그램 #

확장하기 편한 언어는 subpath가 필요 없는 php이고, 그외 환경은 앱 자체에서 subpath를 지원해야하는 경우가 많습니다.
간단히 환경별로 몇개만 테스트하여 작성하였고 내용은 계속 추가될 겁니다. 프로그램별로 사용법이 필요한 경우도 있지만 여기서는 다루지 않고 오직 설치방법만 안내했으니 검색해보시기 바랍니다. 

전 컨텐츠 소비용 앱을 주로 찾아보는 중이긴 한데 사용자분들도 추천할 만한 앱 소개나 사용기 있으면 글 작성 부탁 드립니다.

imueRoid님의 마이코믹스와 mStream은 강추합니다.

