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

## nginx ##

> [공식 홈페이지](https://www.nginx.com/)
 

nginx는 웹 서버로 SJVA에서는 reverse proxy server 역할을 합니다.

서브 도메인도 설정은 가능하나 그건 개별적으로 설정을 하셔야하며 여기서는 서브 패스 설정만 다룹니다.

## nginx 설치 ##

nginx 설치 후에는 도커를 재시작 해야 반영됩니다.

설치 후에는 ```/app/pre_start.sh``` 파일이 생성됩니다.

```
#!/bin/sh
nginx
php-fpm7 -R
```

이 파일은 도커 시작히 ```/app/start.sh``` 파일보다 먼저 실행되며, SJVA와 상관없는 프로그램을 도커 시작시 실행하고자 할 때 이 파일에 명령을 작성하시면 됩니다.


정상적으로 설치완료 후에는

[NGINX](/www/index.html)
[phpinfo](/www/phpinfo.php)
[manual](/www/manual.php)

3가지 기본 페이지 접속이 되며,
[File Browser](/filebrowser)





SJVA의 nginx 플러그인은 

nginx : 


기존 SJVA 도커는 SJVA 포트를 직접 연결하였으나, nginx 플러그인 설치후에는 도커 시작 직후 nginx를 시작하고 nginx를 통하여 SJVA에 접속하게 됩니다.







```
ㅁㅇㅁㅇ
```
