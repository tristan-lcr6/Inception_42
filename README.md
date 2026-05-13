# Inception_42

This project has been created as part of the 42 curriculum by tlecuyer

Le but est de **faire un mini site web** et surtout de **créer ton propre petit Datacenter de ce site**

1. **Le Docker MariaDB : Il cache tes données et ne parle à personne sauf au bunker WordPress.
2. **Le Docker WordPress/PHP : Il fabrique les pages web mais reste caché du public.
3. **Le Docker NGINX : C'est le seul qui a une fenêtre sur l'extérieur. Il vérifie l'identité des visiteurs (SSL/TLS) avant de leur donner accès aux pages.

> "Inception, c'est apprendre à transformer une machine virtuelle en un serveur web , automatisé et sécurisé.

### Makefile instruction

- all :
	- setup
	- build
	- up 

- setup:
	- creat the necessary directories for mariadb and wordpress

- build:
	- build all the docker images using docker-compose

- up:
	- start running the containers

- down:
	- pause the containers

- stop:
	- stop the containers

- start:
	- start the containers

- clean:
	- down all the containers

- fclean: clean


### Ressources 
- https://tuto.grademe.fr/inception/
- https://youtu.be/aN4PCILrbBg?si=MUI0F3aLk0Ji51qW
- https://github.com/vbachele/Inception
- gemini
- claude
 

 ### Explanations 
 - Virtual Machines and Docker
    - Virtual Machines: Run a full operating system on top of a hypervisor that communicates with bare metals and consume a lot of RAM because each VM has its own kernel.
	- Docker: Containers share the host machine's OS kernel. They only package the application and its dependencies. They are lightweight, and use significantly fewer resources.

 - Secrets and Environment Variables

    - Environment Variables are best for non-sensitive configuration. They are easy to use but often visible in Docker Logs

    - Secrets are specifically designed for sensitive data (DB_PASSWORD, API_KEY...). They are encrypted and mounted into the container in a way that prevents them from being accidentally logged or committed.

 - Docker Network and Host Network

    - Docker Network (Bridge): By default Containers sit in an isolated private network. You must explicitly "expose" ports to the outside world. It provides security and isolation between services.

    - Host Network: The container shares the host's IP and networking stack directly. There is no isolation; if the container listens on port 80, it is immediately live on the host's port 80. It is faster but less secure.