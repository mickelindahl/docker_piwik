# Docker piwik

Instructions and files for setting up (piwik)[https://piwik.org/] in a docker container and 
accesing it through a docker container (nginx)[https://github.com/jwilder/nginx-proxy] 
as a reverse proxy.

## Installation

Clone the repository and cd into project directory

Run `cp sample-docker-compose.yml docker.compose.yml`

Open `docker.compose.yml` and add a prefered mysql outgoing port and set VIRTUAL_HOST
to the domain/subdomain you want to use for your piwik server. One can also remove 
the ports sectin on db if no external access is perfered.

Run `docker-compose up -d && cd ..` 

Clone [docker_nginx](https://github.com/mickelindahl/docker_nginx) and follow 
installation instructions there.

Add the following code to docker_nginx `docker-compose.yml` file. This will
add the static html files from piwik to nginx server such that the nginx server
can server these. Fastcgi will be forward to the piwik container.

```
volumes:
  - {path to project directory}/html:/var/www/html # add
``` 

Run `cp setup.domain.com {your domain/subdomain}`

Open the newly created file and add your subdomain for the fastcgi_pass

Copy the file to `conf/vhost.d/` in nginx project directory. It is important the
the file has the exakt name of you domain/subdomain you want to use

Cd into nginx docker project folder and run
```
docker-compose stop && docker-compose rm -f && docker-compose up -d
``` 

Now piwik should be availabe at you domain/subdomain!!!

