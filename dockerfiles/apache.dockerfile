FROM nimmis/alpine-apache

ADD apache.conf /etc/apache2/conf.d/my-settings.conf
ADD index.php /var/www/index.php
