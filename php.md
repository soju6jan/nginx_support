# php #

php 모듈은 nginx 플러그인 설치시 같이 설치됩니다.

기본적인 모듈은 같이 설치되어 있고 [phpinfo.php](/www/phpinfo.php)에서 확인 가능하며 추가로 필요한 모듈은 ssh에서 ```apk add 모듈명``` 명령으로 설치할 수 있습니다.

php 프로그램들은 ```/app/data/www``` 하위 폴더에 위치해야하며 ```nginx.conf``` 설정은 따로 할 필요가 없고 일반적으로  ```/www/프로그램명/index.php``` 로 접속이 됩니다. 

subpath를 설정할 필요가 없기 때문에 php 프로그램이 가장 확장하기 좋습니다.

-----


# myComix #

imurRoid 님이 만드신 최고의 만화뷰어입니다.

![](https://cdn.discordapp.com/attachments/631112094015815681/762294271205179422/unknown.png)


- [자동 설치](/nginx/noapi/install?title=myComix&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/myComix.sh)

- 접속 URL : [/www/myComix/index.php](/www/myComix/index.php)

- 홈페이지 : [마이코믹스 만화뷰어 0.17 업데이트](https://sjva.me/bbs/board.php?bo_table=tip&wr_id=1916)

 - 설치명령
    ```
    cd /app/data/nginx/www
    git clone https://github.com/imueRoid/myComix
    chmod 777 -R /app/data/nginx/www
    ```






