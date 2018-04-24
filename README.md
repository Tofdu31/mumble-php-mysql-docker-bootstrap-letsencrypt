[![Twitter](https://img.shields.io/badge/Twitter-%40jeckel4-blue.svg)](https://twitter.com/jeckel4) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Julien%20Mercier-blue.svg)](https://www.linkedin.com/in/jeckel/)

# PHP-MySQL Docker Bootstrap

This repository is used as a bootstrap for PHP/MySQL projects using docker.

# How to use it

Just go to [Releases](https://github.com/jeckel/php-mysql-docker-bootstrap/releases) and download the latest release in your project folder.

Run `make install` and this will bootstrap your environment and your composer installation.

You can then edit your `.env` file, `docker-composer.yml` etc. It's up to you.

# Included

In this bootstrap you will have

- A `docker-compose` configuration with PHP and MySQL
- A `php` container with mysql extension and `composer` installed

# Requirements

To work, all you need is :
- `make`
- `docker`
- `docker-composer`
