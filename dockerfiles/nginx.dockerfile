FROM alpine

RUN apk add nginx php5 php5-fpm php5-cgi
RUN mkdir /run/nginx

ADD nginx.conf /etc/nginx/nginx.conf
ADD index.php /var/www/index.php

#ENTRYPOINT [nginx -c /etc/nginx/nginx.conf, php-fpm5]
EXPOSE 80
