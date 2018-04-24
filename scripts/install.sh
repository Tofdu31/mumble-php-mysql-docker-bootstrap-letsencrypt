#!/usr/bin/env bash

__USER="$(id -u):$(id -g)"
__COMPOSER_CMD="docker-compose run --rm --no-deps -u ${__USER} php composer"

# Identify project root directory
if [ $(git status > /dev/null 2>&1) ] ; then
    PROJECT_DIR=$(git rev-parse --show-toplevel)
else
    PROJECT_DIR=$(pwd -P)
fi

# Install default .env file
if [ ! -f $PROJECT_DIR/.env ]; then
    cp $PROJECT_DIR/.env.dist $PROJECT_DIR/.env
fi

# Initialize composer
if [ ! -f $PROJECT_DIR/composer.json ]; then
    ${__COMPOSER_CMD} init
fi
