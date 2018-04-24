.PHONY: build composer composer-install composer-update

-include .env

UID=$(shell id -u)
GID=$(shell id -g)

DOCKER_IMAGE?="traffic-rer"
DOCKER_CMD=docker run --rm -it -v `pwd`:/project -u ${UID}:${GID} $(DOCKER_IMAGE)
COMPOSER_CMD=docker run --rm -it -v `pwd`:/project -u ${UID}:${GID} --entrypoint composer $(DOCKER_IMAGE)

default: up

build:
	@docker build -t ${DOCKER_IMAGE} .

composer:
	@${DOCKER_CMD} composer ${CMD}

composer-install:
	@${DOCKER_CMD} composer install

composer-update:
	@${COMPOSER_CMD} update

run:
	@${DOCKER_CMD}

up:
	docker-compose up

install:
	@./scripts/install.sh
