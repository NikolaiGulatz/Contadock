FROM php:7.1-apache

ARG CONTAO_VERSION="4.4.*"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
      git \
      wget \
      zip \
      unzip \
      libmagickwand-dev \
      libpng-dev \
      zlib1g-dev \
      libicu-dev \
      g++ && \
    pecl install \
      imagick && \
    docker-php-ext-install \
      pdo_mysql \
      gd \
      intl && \
    docker-php-ext-enable \
      imagick && \
    rm -rf /tmp/* /var/cache/apk/* && \
    a2enmod rewrite && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

COPY apache.conf /etc/apache2/sites-enabled/000-default.conf

RUN COMPOSER_MEMORY_LIMIT=-1 composer \
    create-project \
    contao/managed-edition \
    /var/www/html \
    $CONTAO_VERSION
RUN wget https://download.contao.org/contao-manager.phar \
    -O /var/www/html/web/contao-manager.phar.php

WORKDIR /var/www/html

RUN COMPOSER_MEMORY_LIMIT=-1 composer \
    require \
    madeyourday/contao-rocksolid-custom-elements:^2.0 \
    madeyourday/contao-rocksolid-antispam:^2.0

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 777 /tmp

CMD ["apache2-foreground"]
