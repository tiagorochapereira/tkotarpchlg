docker volume create drupal-postgres-lib
docker volume create drupal-postgres-data
docker run -d --name drupal-postgres \
	-p 5432:5432 \
	-e POSTGRES_DB=drupal \
	-e POSTGRES_USER=drupaluser \
	-e POSTGRES_PASSWORD=drupalpass \
	-v drupal-postgres:/var/lib/postgresql \
	-v drupal-postgres-data:/var/lib/postgresql/data \
	postgres
sudo firewall-cmd --permanent --add-port=5432/tcp
sudo firewall-cmd --reload

# Drupal
docker run --name drupal -d \
	-p 8081:80 \
	drupal

sudo firewall-cmd --permanent --add-port=8081/tcp
sudo firewall-cmd --reload

DB host: 172.31.23.221