FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

# On expose le port par défaut de MySQL
EXPOSE 3306

# On copie un script de configuration qu'on va créer juste après
COPY tools/setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh

# Lancement du script au démarrage
ENTRYPOINT ["/usr/local/bin/setup.sh"]