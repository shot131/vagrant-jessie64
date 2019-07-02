#!/usr/bin/env bash
sed -i -e "s/^127.0.1.1\t$SITE_URL.*$/$HOST_IP www.$SITE_URL $SITE_URL/g" /etc/hosts
sed -i -e "s/^export APACHE_RUN_USER.*$/export APACHE_RUN_USER=vagrant/g" -e "s/^export APACHE_RUN_GROUP.*$/export APACHE_RUN_GROUP=vagrant/g" /etc/apache2/envvars
sed -e "s/SITE_NAME/$SITE_URL/g" -e "s/HOST_IP/$HOST_IP/g" /vagrant/vagrant/provision/apache/vhost.conf > "/etc/apache2/sites-enabled/$SITE_URL.conf"
cp /vagrant/vagrant/provision/php/user.ini /etc/php/7.1/apache2/conf.d/user.ini
service apache2 start
service mysql start