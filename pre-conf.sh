#!/bin/bash
set -e

#missing from original repository ... 
wget https://github.com/Samnan/MyWebSQL/releases/download/v3.9/mywebsql.zip
unzip mywebsql.zip -d /var/www
rm -rf /var/www/mywebsql/index.html
rm mywebsql.zip

 #apache2 conf
 a2enmod rewrite
 chown -R www-data:www-data /var/www/mywebsql /var/log/apache2
 sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/mywebsql/' /etc/apache2/sites-enabled/000*.conf
 sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php/7.2/apache2/php.ini
 sed -i "s/error_reporting = .*$/error_reporting = E_ERROR | E_WARNING | E_PARSE/" /etc/php/7.2/apache2/php.ini
 sed -i -e "s@\$ALLOW_CUSTOM_SERVERS.*@\$ALLOW_CUSTOM_SERVERS = TRUE;@g" /var/www/mywebsql/config/servers.php
 rm -R /var/www/html/
 
 #to fix error relate to ip address of container apache2
 echo "ServerName localhost" | tee /etc/apache2/conf-available/fqdn.conf
 ln -s /etc/apache2/conf-available/fqdn.conf /etc/apache2/conf-enabled/fqdn.conf
