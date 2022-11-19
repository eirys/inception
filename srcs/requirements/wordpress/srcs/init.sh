#!/bin/sh

# If wp-config.php already exists
if [ -f /home/public_html/wp-config.php ]
then
	echo "Wordpress already installed."
else
	# STEP 1: Download core files for wordpress
	wp core download --allow-root --path="/home/public_html"
	chown -R www-data:www-data /home/public_html

	# STEP 2: Replace with env variables in wp-config.php
	cp /root/wp-config.php /home/public_html/wp-config.php
	sed -i "s/MYSQL_DATABASE/${MYSQL_DATABASE}/g" /home/public_html/wp-config.php
	sed -i "s/MYSQL_PASSWORD/${MYSQL_PASSWORD}/g" /home/public_html/wp-config.php
	sed -i "s/MYSQL_USER/${MYSQL_USER}/g" /home/public_html/wp-config.php
	sed -i "s/MYSQL_HOSTNAME/${MYSQL_HOSTNAME}/g" /home/public_html/wp-config.php

	# STEP 3: Install wordpress
	wp core install --allow-root \
	--path="/home/public_html" \
	--url="$MY_LOGIN.42.fr" \
	--title="my website lol" \
	--admin_user=$MYSQL_USER \
	--admin_password=$MYSQL_PASSWORD \
	--admin_email="$MY_EMAIL"
fi

# Launching wp
exec "$@"
