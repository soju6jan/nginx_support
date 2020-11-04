
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

◼ /var/lib/tomcat/conf/server.xml 수정 (goodstory님 제보)
168줄부터(정확히는 <host></host> 부분의 내부에) 아래 내용 추가

```
<Valve className="org.apache.catalina.valves.RemoteIpValve"
    internalProxies="127.0.0.1"
    remoteIpHeader="X-Forwarded-For"
    remoteIpProxiesHeader="X-Forwarded-By"
    protocolHeader="x-forwarded-proto" /> 
```




----
# Aria2c

다운로드 툴

최고의 다운로드 프로그램이고 저도 플러그인을 만들어 소개했지만 프로그램 자체가 CLI기반이라 쉽게 사용하기 힘든 프로그램입니다.

플러그인 대신 이걸로 대체합니다. [참고](https://sjva.me/bbs/board.php?bo_table=manual&wr_id=568)

웹페이지는 정적페이지로 다른 곳에 설치된 aria2와도 연결이 됩니다.

(localhost aria2c가 실행되는 곳이 아닌 브라우저를 실행한 곳)

◼ [설치](/nginx/normal/install?title=aria2c&script_url=https://raw.githubusercontent.com/soju6jan/nginx_support/main/install/php/aria2c.sh&arg=install)

◼ 접속 URL : [/www/webui-aria2/docs/index.html](/www/webui-aria2/docs/index.html)

◼ conf
```
location /jsonrpc {
    proxy_pass         http://127.0.0.1:6800;
    proxy_set_header   Host $host;
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Host $server_name;
}
```

◼ 실행 예
```
/usr/bin/aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all -d /app/data/download --rpc-listen-port=6800 --bt-tracker=udp://93.158.213.92:1337/announce,udp://62.210.97.59:1337/announce,udp://151.80.120.115:2710/announce,udp://208.83.20.20:6969/announce,udp://185.181.60.67:80/announce,udp://194.182.165.153:6969/announce,udp://5.206.3.65:6969/announce,udp://37.235.174.46:2710/announce,udp://89.234.156.205:451/announce,udp://92.223.105.178:6969/announce,udp://207.241.231.226:6969/announce,udp://207.241.226.111:6969/announce,udp://51.15.40.114:80/announce,udp://91.149.192.31:6969/announce --seed-time=0
```




