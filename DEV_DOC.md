Set up the environment from scratch (prerequisites, configuration files, se-
crets).
◦ Build and launch the project using the Makefile and Docker Compose.
◦ Use relevant commands to manage the containers and volumes.
◦ Identify where the project data is stored and how it persists



1. Environment Setup

Before launching, you must prepare the host machine
- Docker & Docker Compose installed.
- Domain Mapping: Edit your /etc/hosts file to redirect your local IP to your domain: 127.0.0.1  tlecuyer.42.fr.
- Create a .env file in the root directory.
```
# MariaDB
MYSQL_ROOT_PASSWORD=
MYSQL_DATABASE=
MYSQL_USER=
MYSQL_PASSWORD=

# WordPress
DOMAIN_NAME=
WP_TITLE=
WP_ADMIN_USER=
WP_ADMIN_PASSWORD=
WP_ADMIN_EMAIL=
WP_USER=
WP_USER_EMAIL=
WP_USER_PASSWORD=
FTP_USER=
FTP_PASSWORD=
```
2. Build & Launch

Makefile intialisation and start
```Bash
make all
docker images
```



Use these commands to monitor and manage the stack:
```Bash
|--------------Command-----------------|
|`docker ps`                           |
|`docker-compose logs -f`              |
|`docker exec -it <container_name> sh` |
|`docker volume ls`                    |
|`docker network ls`                   |
|--------------------------------------|
```



Docker lose data when deleted. To prevent this, we use **Volumes**.

### Where is the data?
The project maps internal container paths to your physical host machine:
*   **WordPress Files:** `/home/login/data/wordpress`
*   **Database Files:** `/home/login/data/mariadb`

### How it persists
In your `docker-compose.yml`, these paths are linked. Even if you run `make down`, your files remain safely on the host disk. When you run `make up` again, the containers "re-attach" to these folders, and your website appears exactly as you left it.
