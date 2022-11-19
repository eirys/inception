FROM debian:buster

# Copy the script and the wp-config.php file.
# NB: wp-config.php is generated via wp-cli. I chose to do it prior and copy it.
COPY ./srcs/init.sh /usr/local/bin/
COPY ./srcs/wp-config.php /root/

# Install wordpress php packages, install wp-cli, setup init.sh,
# & create directory to allow php to run
RUN apt-get update -y \
&& apt-get install -y php7.3-fpm \
php7.3-mysql \
php7.3-json \
php7.3-xmlrpc \
php7.3-curl \
php7.3-gd \
php7.3-xml \
php7.3-mbstring \
mariadb-client \
wget \
&& apt-get clean \
&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& mv wp-cli.phar /usr/bin/wp \
&& chmod +x /usr/bin/wp \
&& chmod +x /usr/local/bin/init.sh \
&& mkdir /var/run/php

# Copy conf file in proper directory
COPY ./srcs/www.conf /etc/php/7.3/fpm/pool.d/

WORKDIR /home/public_html

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/init.sh"]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
