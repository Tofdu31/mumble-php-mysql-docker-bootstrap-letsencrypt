ARG MYSQL_VERSION=latest
FROM mysql:${MYSQL_VERSION}

LABEL maintainer="Christophe Laborde <christophe.laborde@nbility.fr>"

#####################################
# Set Timezone
#####################################

ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/

COPY sql/mysql.cnf /etc/mysql/conf.d/mysql.cnf

RUN chmod 0444 /etc/mysql/conf.d/mysql.cnf

CMD ["mysqld"]

EXPOSE 3306

FROM php:alpine
LABEL maintainer="Julien MERCIER <devci@j3ck3l.me>"
# This Dockerfile build a php image with composer included
# It used for development only
#
# Reminder : It's not recommanded to have composer installed in container for production
# as this is required for developpement only.
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/863c57de1807c99d984f7b56f0ea56ebd7e5045b/web/installer -O - -q | php -- --quiet &&\
    mv composer.phar /usr/local/bin/composer && \
    composer self-update

# Define composer cache directory
RUN mkdir -p /tmp/composer && chmod 777 /tmp/composer
ENV COMPOSER_CACHE_DIR=/tmp/composer

RUN docker-php-ext-install pdo_mysql

WORKDIR /project
