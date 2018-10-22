FROM centos

RUN yum install -y epel-release
RUN yum install -y nginx php-fpm
RUN yum install -y vim less net-tools lsof

COPY nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/defaul.conf
ADD index.php /var/www/index.php
COPY php-fpm.conf /etc/php-fpm.d/www.conf

#ENTRYPOINT [nginx, php-fpm5]
EXPOSE 80
