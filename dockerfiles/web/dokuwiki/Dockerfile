FROM php:7-fpm

MAINTAINER Diablo02000

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
        imagemagick \
    && docker-php-ext-install -j$(nproc) iconv mcrypt xml simplexml \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apt-get clean

COPY www.conf /usr/local/etc/php-fpm.d/www.conf 
