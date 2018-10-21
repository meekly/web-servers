.PHONY: build-apache build-nginx apache nginx clean

# Building
build-apache:
	docker-compose build apache

build-nginx:
	docker-compose build nginx

# Running
apache: build-apache
	docker-compose run --rm --service-ports apache

nginx: build-nginx
	docker-compose run --rm --service-ports nginx

clean:
	find . -name '*~' -type f -exec rm -f \{\} \;
