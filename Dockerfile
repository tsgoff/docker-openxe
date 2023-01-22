FROM bios/openxe-base

ARG TAG

RUN cd /var/www && \
    curl -L -o /var/www/openxe.zip https://github.com/OpenXE-org/OpenXE/archive/refs/tags/${TAG}.zip && \
    unzip openxe.zip -x "OpenXE-*/userdata/wiki/XentralHandbuch/*" && \
    rm -f openxe.zip && \
    rm -rf /var/www/html && \
    mv OpenXE-* html && \
    chown -R www-data:www-data html
