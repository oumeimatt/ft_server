FROM debian:buster
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y wget

# Setting up nginx
RUN apt-get install -y nginx 
RUN rm etc/nginx/sites-enabled/default
COPY srcs/default.conf etc/nginx/conf.d/

# Setting up openssl

RUN mkdir etc/nginx/ssl
COPY /srcs/ssl.crt /etc/nginx/ssl/
COPY /srcs/ssl.key /etc/nginx/ssl/

# Setting up php & PhpMyAdmin
RUN apt-get install -y php7.3 php7.3-common php7.3-mbstring php7.3-mysql php7.3-fpm php7.3-readline php7.3-opcache php7.3-json
RUN apt-get install -y php-json php-mbstring 
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-english.tar.gz
RUN tar -xvf phpMyAdmin-4.9.4-english.tar.gz
RUN mkdir /var/www/localhost
RUN rm phpMyAdmin-4.9.4-english.tar.gz
COPY srcs/config.inc.php /etc/nginx/conf.d/


# Setting up MySQL
RUN apt-get install -y lsb-release gnupg
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb
RUN echo 'mysql-apt-config mysql-apt-config/select-server select mysql-5.7' | debconf-set-selections
RUN dpkg -i mysql-apt-config_0.8.14-1_all.deb
RUN rm -f mysql-apt-config_0.8.14-1_all.deb
RUN apt-get update
RUN apt-get install -y mysql-server

#Setting up wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mkdir /var/www/localhost/wordpress
RUN mv phpMyAdmin-4.9.4-english /var/www/localhost/wordpress/phpmyadmin
RUN cp -a wordpress/. /var/www/localhost/wordpress
COPY srcs/wp-config.php /var/www/localhost/wordpress



RUN chown -R www-data /var/www/*
RUN chmod 755 /var/www/*

EXPOSE 80 443
CMD chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && service mysql start && service php7.3-fpm start && service nginx start && echo "CREATE DATABASE wp_db;" | mysql -u root && echo "GRANT ALL PRIVILEGES ON wp_db.* TO 'wp_user'@'localhost' IDENTIFIED BY '123';" | mysql -u root  ; cat
  