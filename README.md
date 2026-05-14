# Inception_42


This project was created as part of the 42 curriculum by tlecuyer.

The goal is to build a mini-website and, more importantly, to create a **small datacenter to host it**.

### The Infrastructure
   1. MariaDB Docker: It stores your data and remains isolated, communicating only with the WordPress "bunker."

   2. WordPress/PHP Docker: It generates the web pages but stays hidden from the public.

   3. NGINX Docker: This is the only container with a "window" to the outside world. It verifies visitor identities via SSL/TLS before granting access to the site.

> "Inception is about learning how to transform a virtual machine into a professional, automated, and secure web server."

### Makefile Instructions

- all:
	- Runs setup, build, and up.

- setup:
	- Creates the necessary local directories for MariaDB and WordPress volumes.

- build:

	- Builds all Docker images using docker-compose.

- up:
    - Starts the containers in the background.

- down:
    - Stops and removes the containers (pauses the project).

- stop:
	- Stops the running containers without removing them.

- start:
	- Restarts the stopped containers.

- clean:
	- Shuts down all containers and performs basic cleanup.

- fclean:
    - Performs a full cleanup (equivalent to clean but usually includes removing volumes and images).

### Ressources 
- https://tuto.grademe.fr/inception/
- https://youtu.be/aN4PCILrbBg?si=MUI0F3aLk0Ji51qW
- https://github.com/vbachele/Inception
- gemini
- claude

``` ia has been used during this project mostly for a purpose of understanding , and for configuration files ```
 

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