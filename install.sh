if [ ! -f .env ]; then 

   echo "Missing .env please create it by cp sample.env .env and then edit .env"

fi

CURRENT_DIR=$(pwd)

export $(cat .env | xargs)

cp sample.docker-compose.yml docker-compose.yml
sed -i "s/{virtual-host}/$VIRTUAL_HOST/g" docker-compose.yml
sed -i "s/{db-pass}/$DB_PASS/g" docker-compose.yml
sed -i "s/{db-external-port}/$DB_EXTERNAL_PORT/g" docker-compose.yml

cp sample.nginx-piwik.env nginx-piwik.env
sed -i "s#{path-html}#$(pwd)/html#g" nginx-piwik.env
mv nginx-piwik.env $PATH_NGINX/nginx-piwik.env

echo "Install nginx with piwik html volume mounted"
cd $PATH_NGINX && ./install.sh && cd $CURRENT_DIR

cp sample.domain.com $VIRTUAL_HOST
sed -i "s/{virtual-host}/$VIRTUAL_HOST/g"  $VIRTUAL_HOST
mv $VIRTUAL_HOST $PATH_NGINX/conf/vhost.d/$VIRTUAL_HOST

docker-compose stop
docker-compose rm -f

docker-compose up -d

echo ""
echo "Please navigate to $VIRTUAL_HOST and follow the setup"
echo ""
echo "Database server: db"
echo "Login: root"
echo "Password: $DB_PASS"
echo "Database name: piwik" 


