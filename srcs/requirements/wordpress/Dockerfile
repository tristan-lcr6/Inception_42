FROM debian:bullseye
 
RUN apt-get update && apt-get install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-xml \
    php7.4-mbstring \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*
 
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
 
RUN mkdir -p /var/www/html/wordpress \
    && chown -R www-data:www-data /var/www/html
 
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
 
COPY tools/wp-setup.sh /usr/local/bin/wp-setup.sh
RUN chmod +x /usr/local/bin/wp-setup.sh
 
EXPOSE 9000
 
ENTRYPOINT ["wp-setup.sh"]












# FROM debian:bullseye

# RUN apt-get update -y && apt-get upgrade -y && \
#     apt-get install -y wget php7.4 php-fpm php-mysql mariadb-client

# # On a besoin de créer le dossier pour PHP-FPM
# RUN mkdir -p /run/php

# # On copie notre config PHP-FPM
# COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# # On installe le CLI de Wordpress (indispensable pour setup.sh)
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp

# COPY tools/setup.sh /usr/local/bin/setup.sh
# RUN chmod +x /usr/local/bin/setup.sh

# WORKDIR /var/www/wordpress

# ENTRYPOINT ["setup.sh"]