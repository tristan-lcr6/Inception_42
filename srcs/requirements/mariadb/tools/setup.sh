#!/bin/bash

mkdir -p /var/run/mysqld
chown -R mysql:mysql /var/run/mysqld

# Initialise la base si première fois
if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Démarre MariaDB en arrière-plan
mysqld_safe --skip-networking &

# Attend que MariaDB soit prêt
echo "Attente démarrage MariaDB..."
until mysqladmin ping --silent 2>/dev/null; do
    sleep 1
done
echo "MariaDB prêt, création de la base..."

# Crée la base et l'utilisateur
mysql -u root -e "DELETE FROM mysql.user WHERE User='';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

echo "Base et utilisateur créés !"

# Arrête MariaDB proprement
mysqladmin shutdown

# Relance au premier plan avec réseau
exec mysqld_safe --bind-address=0.0.0.0
