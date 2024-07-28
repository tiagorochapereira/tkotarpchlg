docker volume create wps-postgres-lib
docker volume create wps-postgres-data
docker run -d --name wps-postgres \
	-p 5434:5432 \
	-e POSTGRES_DB=wordpress \
	-e POSTGRES_USER=wordpressuser \
	-e POSTGRES_PASSWORD=wordpresspass \
	-v wps-postgres:/var/lib/postgresql \
	-v wps-postgres-data:/var/lib/postgresql/data \
	postgres
sudo firewall-cmd --permanent --add-port=5434/tcp
sudo firewall-cmd --reload

docker run --name wordpress -d \
    -p 8082:80 \
    -e WORDPRESS_DB_HOST=172.31.23.221 \
    -e WORDPRESS_DB_USER=wordpressuser \
    -e WORDPRESS_DB_PASSWORD=wordpresspass \
    -e WORDPRESS_DB_NAME=wordpress \
    -e WORDPRESS_TABLE_PREFIX=wps \
wordpress

sudo firewall-cmd --permanent --add-port=8082/tcp
sudo firewall-cmd --reload