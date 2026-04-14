#!/bin/bash

cd /var/www/html/wordpress

# Télécharge WordPress en premier
if [ ! -f wp-login.php ]; then
    wp core download --allow-root --locale=fr_FR
fi

# Attendre que MariaDB soit prêt
until mysqladmin ping -h mariadb --silent 2>/dev/null; do
    sleep 1
done

# Crée wp-config.php si pas encore fait
if [ ! -f wp-config.php ]; then
    wp config create \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --allow-root
fi

# Installe WordPress si pas déjà installé
if ! wp core is-installed --allow-root 2>/dev/null; then
    wp core install \
        --url=$DOMAIN_NAME \
        --title="$WP_TITLE" \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --allow-root

    wp user create $WP_USER $WP_USER_EMAIL \
        --role=author \
        --user_pass=$WP_USER_PASSWORD \
        --allow-root
fi

# Lance PHP-FPM au premier plan
php-fpm7.4 -F
