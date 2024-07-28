
docker volume create moodle-postgres-lib
docker volume create moodle-postgres-data
docker run -d --name moodle-postgres \
	-p 5433:5432 \
	-e POSTGRES_DB=moodle \
	-e POSTGRES_USER=dmoodleuser \
	-e POSTGRES_PASSWORD=moodlepass \
	-v moodle-postgres:/var/lib/postgresql \
	-v moodle-postgres-data:/var/lib/postgresql/data \
	postgres

 dnf install httpd-tools httpd pgadmin4-httpd

 wget https://download.moodle.org/download.php/direct/stable404/moodle-latest-404.tgz
 tar zxvf moodle-latest-404.tgz
 mv moodle/* /var/www/html/

dnf install policycoreutils-python-utils
/usr/bin/audit2why < /var/log/audit/audit.log

setsebool -P httpd_unified 1
setsebool -P httpd_can_network_connect 1
setsebool -P nis_enabled 1
setenforce 0

mkdir /var/www/moodledata
chown apache:apache /var/www/moodledata

vi /etc/php/php.ini
max_input_vars = 5000
sudo systemctl restart php-fpm.service

admin
Admin123.