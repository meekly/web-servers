FROM debian

RUN apt-get -y update && apt-get install -y apache2 libapache2-mod-php vim less
RUN a2enmod headers

RUN mkdir -p /var/www/html/noway
RUN mkdir -p /var/www/html/admin

ADD index.php /var/www/html/noway/index.php
ADD index.php /var/www/html/admin/index.php
ADD index.php /var/www/html/index.php

RUN rm /var/www/html/index.html

RUN sed -i -E 's|#(ServerRoot)|\1|' /etc/apache2/apache2.conf
RUN sed -i -E 's|^.*sites-enabled.*$||' /etc/apache2/apache2.conf

ADD apache.conf /etc/apache2/conf-enabled/my.conf

RUN htpasswd -cb /etc/apache2/.htpasswd admin admin

EXPOSE 80

CMD service apache2 start && tail -f /var/log/apache2/access.log
