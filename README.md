# Docker piwik

Instructions and files for setting up (piwik)[https://piwik.org/] in a docker container and 
accesing it through a docker container (nginx)[https://github.com/jwilder/nginx-proxy] 
as a reverse proxy.

## Pre installation
Make sure that you have nginx revere proxy installed https://github.com/mickelindahl/docker_nginx

## Installation

Clone the repository and cd into project directory

Run `cp sample.env .env`

Open .env and edit

Run as root
```
./install.sh
```

Done!

