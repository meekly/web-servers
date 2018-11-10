.PHONY: build-apache build-nginx apache nginx clean

# Building
build-apache:
	docker-compose build apache

build-nginx:
	docker-compose build nginx

build-both:
	docker-compose build both

build-mysql:
	docker-compose build mysql

build-phpim:
	docker-compose build phpim

# Running
all: build-apache build-nginx build-mysql build-phpim
	docker-compose up -d

apache: build-apache
	docker-compose run --rm --service-ports apache

nginx: build-nginx
	docker-compose up nginx

both: build-both
	docker-compose run --rm --service-ports both

mysql:
	docker-compose run --rm --service-ports mysql

phpim:
	docker-compose run --rm --service-ports phpim

clean:
	find . -name '*~' -type f -exec rm -f \{\} \;
