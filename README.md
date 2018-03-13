# Docker piwik

Instructions and files for setting up (piwik)[https://piwik.org/] in a docker container and 
accesing it through a docker container (nginx)[https://github.com/jwilder/nginx-proxy] 
as a reverse proxy.

## Pre installation
Make sure that you have nginx revere proxy installed https://github.com/mickelindahl/docker_nginx

## Installation

Wiht erverse proxy out add in onfig/config.ini.php
```
[proxy]
host =      ; Proxy host: the host name of your proxy server (mandatory)
port =      ; Proxy port: the port that the proxy server listens to. There is no standard default, but 80, 1080, 3128, and 8080 are popular
```



Clone the repository and cd into project directory

Run `cp sample.env .env`

Open .env and edit

Run as root
```
./install.sh
```

Done!

