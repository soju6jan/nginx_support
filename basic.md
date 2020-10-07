
-----
# Rclone GUI

Rclone WEB GUI

따로 설치가 필요없고 rclone 명령을 통해 실행합니다.

◼ [홈페이지](https://rclone.org/gui/)

◼ 접속 URL : [/rcd/](/rcd/)

◼ 실행 예
```
/app/bin/Linux/rclone rcd --config /app/data/db/rclone.conf --rc-user=sjva --rc-pass=sjva --rc-allow-origin="*" --rc-web-gui --rc-web-gui-update --rc-web-gui-no-open-browser --rc-baseurl rcd --rc-addr 127.0.0.1:5572
```

◼ conf
```
location /rcd/ {
    proxy_pass http://127.0.0.1:5572/rcd/;
    proxy_set_header Host $http_host;            
    proxy_set_header X-Real-IP  $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```


----
# Guacamole

웹 원격 제어

launcher_guacamole 플러그인을 통해 guacamole을 설치한 후 연동합니다. 

◼ 참고 글 : [https://soju6jan.com/archives/1490](https://soju6jan.com/archives/1490)

◼ 접속 URL : [/guacamole](/guacamole)

◼ conf
```
location /guacamole {
    proxy_pass http://127.0.0.1:8080/guacamole;
    proxy_set_header Host $http_host;            
    proxy_set_header X-Real-IP  $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
}
```


