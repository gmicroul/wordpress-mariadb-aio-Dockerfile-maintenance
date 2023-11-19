FROM wordpress
COPY mariadb-start.sh /
RUN apt-get update -y \
 && apt-get install -y mariadb-server vim \
 && service mariadb start \
 && mysqladmin -u root password "A123456!" \
 && mysql -e "create database wordpress;" \
 && chmod +x /mariadb-start.sh
COPY docker-entrypoint.sh /usr/local/bin/
COPY wp-config-sample.php /var/www/html/wp-config-sample.php
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
