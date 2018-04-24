.PHONY: build composer composer-install composer-update

-include .env

__USER=$(shell id -u):$(shell id -g)
__COMPOSER_CMD=docker-compose run --rm --no-deps -u ${__USER} php composer

default: install up

build:
	@docker build -t ${DOCKER_IMAGE} .

composer:
	@${__COMPOSER_CMD} ${CMD}

composer-install:
	@${__COMPOSER_CMD} install

composer-update:
	@${__COMPOSER_CMD} update

up:
	@docker-compose up

install:
	@./scripts/install.sh
