#!/bin/bash

#cree le dossier pour le socket de Mariadb
mkdir -p /var/run/mysqld
# Donner la propriété à l'utilisateur mysql (créé lors de l'install de mariadb)
chown -R mysql:mysql /var/run/mysqld
# Démarrer MySQL en arrière-plan pour l'initialiser
service mariadb start
#
sleep 5
#

#Quand ton script arrive aux lignes mysql -u root -e "...",
#l'outil client mysql va chercher le fichier /var/run/mysqld/mysqld.sock
# pour envoyer tes commandes SQL au serveur qui tourne en arrière-plan.


# Sécuriser et créer l'utilisateur/la DB (en utilisant les variables du .env)
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MARIABD_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS \`${MARIABD_USER}\`@'%' IDENTIFIED BY '${MARIABD_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${MARIABD_DATABASE}\`.* TO \`${MARIABD_USER}\`@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Arrêter pour redémarrer proprement avec mysqld_safe (obligatoire pour Docker)
mysqladmin -u root shutdown

# Lancer MariaDB au premier plan et autoriser les connexions de tout le réseau
exec mysqld_safe --bind-address=0.0.0.0