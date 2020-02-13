#!/bin/bash

[ -z "$MYSQL_PASSWORD" ] && MYSQL_PASSWORD=$(cat /run/secrets/db_password)
[ -z "$MYSQL_ROOT_PASSWORD" ] && MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
echo
echo
echo '+-------------------------------------------------+'
echo '| Downloading Wordpress and initializing Database |'
echo '+-------------------------------------------------+'
echo
wp core download --path=/tmp/wordpress
wp core config --path=/tmp/wordpress --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD
wp core install --path=/tmp/wordpress --url=$SITEURL --title=$BLOGNAME --admin_user=root --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=$ADMINMAIL
echo
echo 'Done.'


echo
echo
echo '+--------------------------------+'
echo '| Removing temporary Directories |'
echo '+--------------------------------+'
echo
rm -rf /home/*
rm -rf /tmp/wordpress
echo
echo 'Done.'