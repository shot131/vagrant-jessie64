#!/usr/bin/env bash
apt-get update -y && apt-get upgrade -y
apt-get install -y --force-yes curl build-essential python-software-properties tmux screen apt-transport-https lsb-release ca-certificates wget nano zip unzip mc
service sshd restart

wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update -y

apt-get install -y --force-yes apache2 libapache2-mod-php7.1
apt-get install -y --force-yes php7.1 php7.1-cli php7.1-cgi php7.1-common php7.1-curl php7.1-gd php7.1-json php7.1-mbstring php7.1-mysql php7.1-xml php7.1-pdo php7.1-intl php-xdebug
cp /vagrant/vagrant/provision/apache/envvars /etc/apache2/envvars
cp /vagrant/vagrant/provision/apache/sitename.local.conf /etc/apache2/sites-enabled/sitename.local.conf
cp /vagrant/vagrant/provision/php/user.ini /etc/php/7.1/apache2/conf.d/user.ini
mkdir -p /vagrant/log
a2enmod actions php7.1 rewrite alias
service apache2 start
update-rc.d apache2 enable
sudo usermod -a -G vagrant www-data

curl -Ss https://getcomposer.org/installer | php
mv composer.phar /usr/bin/composer

debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password vagrant'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password vagrant'
apt-get install -y --force-yes mysql-server mysql-client mysql-common
update-rc.d mysql defaults
service mysql start
update-rc.d mysql enable
mysql -u root -pvagrant -e "CREATE DATABASE IF NOT EXISTS sitename;"