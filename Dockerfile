FROM php:8.4-cli
COPY . /app
WORKDIR /app
RUN apt-get update && apt-get install -y git

RUN curl -sS https://getcomposer.org/installer | php

RUN mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs \
    build-essential && \
    node --version && \ 
    npm --version

RUN cd /app/src && composer install && npm i
