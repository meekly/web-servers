.PHONY: build-apache build-nginx apache nginx clean

# Building
build-apache:
	docker-compose build apache

build-nginx:
	docker-compose build nginx

build-both:
	docker-compose build both

# Running
apache: build-apache
	docker-compose run --rm --service-ports apache

nginx: build-nginx
	docker-compose up nginx

both: build-both
	docker-compose run --rm --service-ports both

clean:
	find . -name '*~' -type f -exec rm -f \{\} \;
