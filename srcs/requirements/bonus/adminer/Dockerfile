FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    php \
    php-fpm \
    php-mysql \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html/adminer \
    && wget -O /var/www/html/adminer/index.php \
    <https://www.adminer.org/latest.php

RUN mkdir -p /run/php

EXPOSE 8080

CMD ["php8.2", "-S", "0.0.0.0:8080", "-t", "/var/www/html/adminer"]