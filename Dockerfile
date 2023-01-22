FROM php:8.1-apache

RUN apt update &&  apt-get install -y unzip wget zlib1g-dev libzip-dev libc-client2007e-dev libc-client-dev libkrb5-dev libxml2-dev libpng-dev libldap-dev && rm -r /var/lib/apt/lists/*
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl && docker-php-ext-install zip mysqli imap soap gd ldap intl

RUN cd /var/www
    curl -L -o /var/www/openxe.zip https://github.com/OpenXE-org/OpenXE/archive/refs/tags/V.1.7.zip
    unzip openxe.zip -x "OpenXE-*/userdata/wiki/XentralHandbuch/*"
    rm -f openxe.zip
    rm -rf /var/www/html
    mv OpenXE-* html
    chown -R www-data:www-data html

