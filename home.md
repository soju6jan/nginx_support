# NGINX

1. [소개](/www/manual.php?filename=home)
2. [기본 설정]((/www/manual.php?filename=basic)
3. 프로그램
   1. [php](/www/manual.php?filename=php)
   2. nodejs
   3. python
   4. go
   5. java
   
-----

## About nginx ##

> [공식 홈페이지](https://www.nginx.com/)
 

nginx는 웹 서버로 SJVA에서는 reverse proxy server 역할을 합니다.

서브 도메인도 설정은 가능하나 그건 개별적으로 설정을 하셔야하며 여기서는 서브 패스 설정만 다룹니다.


## 도커 실행 명령
```
docker run -d \
  --name sjva \
  -v /root/docker/sjva:/app/data \
  -v /mnt:/mnt \
  -v /:/host \
  -p 9999:9999 \
  --privileged soju6jan/sjva:0.2
```

> ```-v /root/docker/sjva:/app/data``` : 개인에 맞게 수정하세요.
> 
> ```-v /mnt:/mnt```
> 
> ```-v /:/host``` host 루트를 /host로 링크하시는 것을 추천합니다.


## nginx 플러그인 ##

nginx 설치 후에는 도커를 재시작 해야 반영됩니다.

설치 후에는 ```/app/pre_start.sh``` 파일이 생성됩니다.

```
#!/bin/sh
nginx
php-fpm7 -R
```

이 파일은 도커 시작히 ```/app/start.sh``` 파일보다 먼저 실행됩니다. 

SJVA와 상관없는 프로그램을 도커 시작시 실행하고자 할 때 이 파일에 명령을 작성하시면 됩니다.


정상적으로 설치완료 후에는 [index.html](/www/index.html), [phpinfo.php](/www/phpinfo.php), [manual.php](/www/manual.php?filename=home) 3가지 기본 페이지 접속이 되며, 기존 9998포트를 연결했던 [File Browser](/filebrowser)가 ```/filebrowser``` 서브패스를 통해서도 접속이 됩니다.




## conf 파일 ##


리버스 
