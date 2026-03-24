#!/bin/bash

# Démarrer MySQL en arrière-plan pour l'initialiser
service mariadb start

# Sécuriser et créer l'utilisateur/la DB (en utilisant les variables du .env)
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Arrêter pour redémarrer proprement avec mysqld_safe (obligatoire pour Docker)
mysqladmin -u root shutdown

# Lancer MariaDB au premier plan et autoriser les connexions de tout le réseau
exec mysqld_safe --bind-address=0.0.0.0