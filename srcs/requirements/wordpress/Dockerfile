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
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

##redisbonus
RUN apt-get update && apt-get install -y php-redis \

 
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mkdir -p /run/php \
    && mv wp-cli.phar /usr/local/bin/wp
 
RUN mkdir -p /var/www/html/wordpress \
    && chown -R www-data:www-data /var/www/html
 
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
 
COPY tools/wp-config.sh /usr/local/bin/wp-config.sh
RUN chmod +x /usr/local/bin/wp-config.sh
 
##ligne informative car en etant sur le meme reseau tout les dockers ecoute sur tout les ports 
EXPOSE 9000 
 
ENTRYPOINT ["wp-config.sh"]










