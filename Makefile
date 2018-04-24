.PHONY: build composer composer-install composer-update

__USER=$(shell id -u):$(shell id -g)
__COMPOSER_CMD=docker-compose run --rm --no-deps -u ${__USER} php composer

default: install up

composer:
	@${__COMPOSER_CMD} ${CMD}

composer-install: install
	@${__COMPOSER_CMD} install

composer-update:
	@${__COMPOSER_CMD} update

up:
	@docker-compose up

down:
	@docker-compose down -v --remove-orphans

install:
	@./scripts/install.sh
