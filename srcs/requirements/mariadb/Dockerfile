FROM debian:buster

COPY ./srcs/init.sh /var/
COPY ./srcs/config.sql /var/
# This config file will be used by mysqld_safe.
COPY ./srcs/mysql.conf /etc/mysql/mariadb.conf.d/server.cnf

# Install mariadb, giving rights to execute every scripts.
RUN apt-get update \
&& apt-get install -y \
mariadb-server \
mariadb-client \
gettext-base \
&& apt-get clean \
&& chown --recursive mysql:mysql /var/lib/mysql \
&& chmod +x /var/init.sh \
&& chmod +rx /var/config.sql

EXPOSE 3306

ENTRYPOINT ["/var/init.sh"]
