FROM centos

RUN yum install -y epel-release
RUN yum install -y nginx php-fpm
RUN yum install -y vim less net-tools lsof
RUN yum install -y httpd
RUN yum install -y php libapache2-mod-php5

RUN mkdir -p /var/www/html/noway
RUN mkdir -p /var/www/html/admin
RUN mkdir -p /etc/apache2/
RUN mkdir -p /var/www/logs/
RUN htpasswd -cb /etc/apache2/.htpasswd admin admin

RUN sed -i -E 's|#(ServerRoot)|\1|' /etc/httpd/conf/httpd.conf
RUN sed -i -E 's|^.*sites-enabled.*$||' /etc/httpd/conf/httpd.conf
RUN sed -i -E 's|^Listen 80.*$|Listen 3000|' /etc/httpd/conf/httpd.conf

COPY nginx.conf /etc/nginx/nginx.conf
ADD na_nginx.conf /etc/nginx/conf.d/default.conf
ADD index.php /var/www/html/index.php

ADD apache.conf /etc/httpd/conf.d/my.conf

EXPOSE 80

CMD nginx && httpd && tail -f /var/www/logs/access_log
