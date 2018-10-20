FROM nimmis/alpine-apache

ADD apache.conf /etc/apache2/conf.d/my-settings.conf


#CMD exec /usr/sbin/httpd -D FOREGROUND -f /etc/apache2/httpd.conf
EXPOSE 80
