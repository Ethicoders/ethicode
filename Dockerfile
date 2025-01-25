FROM php:8.4-cli
COPY . /app
WORKDIR /app
RUN apt-get update && apt-get install -y git

RUN curl -sS https://getcomposer.org/installer | php

RUN mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

RUN composer install
