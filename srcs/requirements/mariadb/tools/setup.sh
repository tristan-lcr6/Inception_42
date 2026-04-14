#!/bin/bash

mkdir --parents /var/run/mysqld
chown --recursive mysql:mysql /var/run/mysqld

# if no databasefile , installe database
if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Skip networking pour éviter les connexions externes pendant la configuration ET '&' pour le lancer en arrière-plan
mysqld_safe --skip-networking &

# Attend que MariaDB soit prêt
until mysqladmin ping --silent 2>/dev/null; do
    sleep 1
done


mysql -u root -e "DELETE FROM mysql.user WHERE User='';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

#stop mysql
mysqladmin shutdown

# Relance au premier plan avec réseau
exec mysqld_safe --bind-address=0.0.0.0
