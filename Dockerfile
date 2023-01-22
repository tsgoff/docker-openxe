FROM bios/openxe-base

ARG TAG

RUN cd /var/www && \
    curl -L -o /var/www/openxe.zip https://github.com/OpenXE-org/OpenXE/archive/refs/tags/${TAG}.zip && \
    unzip openxe.zip -x "OpenXE-*/userdata/wiki/XentralHandbuch/*" && \
    rm -f openxe.zip && \
    rm -rf /var/www/html && \
    mv OpenXE-* html && \
    chown -R www-data:www-data html

RUN curl -s https://raw.githubusercontent.com/OpenXE-org/OpenXE/ce11caac120a515d9c792839a690f353762b1643/www/setup/setup.php > www/setup/setup.php

