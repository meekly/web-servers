FROM centos

RUN yum install -y epel-release
RUN yum install -y nginx php-fpm
RUN yum install -y vim less net-tools lsof
RUN yum install -y httpd

RUN mkdir -p /var/www/noway
RUN mkdir -p /var/www/admin
RUN mkdir -p /var/www/cache
RUN htpasswd -cb /etc/nginx/.htpasswd admin admin

COPY nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/defaul.conf
ADD index.php /var/www/index.php
COPY php-fpm.conf /etc/php-fpm.d/www.conf

EXPOSE 80

CMD nginx && php-fpm
