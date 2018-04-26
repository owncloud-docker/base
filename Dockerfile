FROM owncloud/ubuntu:bionic

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>" \
  org.label-schema.name="ownCloud Base" \
  org.label-schema.vendor="ownCloud GmbH" \
  org.label-schema.schema-version="1.0"

VOLUME ["/mnt/data"]

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/usr/bin/owncloud"]

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get install -y \
    apache2 \
    libapache2-mod-php \
    php-gd \
    php-json \
    php-mysql \
    php-sqlite3 \
    php-pgsql \
    php-curl \
    php-intl \
    php-mcrypt \
    php-imagick \
    php-zip \
    php-xml \
    php-mbstring \
    php-soap \
    php-ldap \
    php-apcu \
    php-redis \
    smbclient \
    php-smbclient \
    mysql-client \
    postgresql-client \
    sqlite \
    gettext-base \
    patch && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/apache2/sites-available/default-ssl.conf && \
  a2enmod rewrite headers env dir mime ssl expires && \
  mkdir -p /var/www/owncloud /mnt/data/files /mnt/data/config /mnt/data/certs /mnt/data/sessions && \
  chown -R www-data:www-data /var/www/owncloud /mnt/data && \
  chsh -s /bin/bash www-data

COPY rootfs /
WORKDIR /var/www/owncloud
