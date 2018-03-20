FROM php:7.1.1

RUN apt-get update -yqq && \
    apt-get install -yqq curl wget openssh-client git libmcrypt-dev libpq-dev libcurl4-gnutls-dev libicu-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libssh2-1-dev libssh2-1 memcached libmemcached11 libmemcached-dev && \
    docker-php-ext-install mbstring mcrypt curl json intl gd xml zip bz2 opcache pdo_mysql && \
    pecl config-set php_ini /etc/php.ini && \
    pecl install ssh2-1.0 && \
    pecl install memcached && \
    echo "extension=ssh2.so" >> "/usr/local/etc/php/conf.d/docker-php-ext-ssh2.ini" && \
    echo "extension=memcached.so" >> "/usr/local/etc/php/conf.d/docker-php-ext-memcached.ini" && \
    rm -rf /var/lib/lists/*

RUN wget http://deployer.org/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

WORKDIR /project

#ENTRYPOINT ["/usr/local/bin/dep"]
