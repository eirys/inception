#!/bin/sh

# if database exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already created"
else
	# Substract env var to their equivalent
	envsubst < /var/config.sql > /var/config_env.sql

	# Executing config.sql file
	mysqld --bootstrap < /var/config_env.sql
	# Removing now useless file
	rm /var/config_env.sql
fi

# Restart service with correct configuration
exec mysqld_safe
