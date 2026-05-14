This project provides a fully containerized stack.

#### Services Provided

The stack consists of three services:
* **NGINX:** A secure web server handling encrypted traffic (HTTPS).
* **WordPress & PHP-FPM:**  Processes the website logic and content.
* **MariaDB:**  A database that stores all site data.


#### Start the Project

To set up the environment and launch all services, run the following command in your terminal:
```bash
make
```
*This will create the necessary folders, build the Docker images, and start the containers.*

#### Stop the Project

To temporarily stop the services:
```bash
make stop

```

To shut down and remove the containers (without deleting your data):
```bash
make down
```

---

#### Accessing the Project

Once server is running, you can access the site via your browser. You must use **HTTPS**.

* **Main Website:** `https://tlecuyer.42.fr`
* **Admin Panel:** `https://tlecuyer.42.fr/wp-admin`

> Since we use self-signed SSL certificates, your browser must show a Warning." Click **Advanced** and then **Proceed** to access the site.

---

#### Locating Credentials

For security reasons, passwords are not hardcoded. They are stored in `.env` file located at the root of the repository. You will find:

* `MYSQL_ROOT_PASSWORD`: The master for the database.
* `WP_USER`: The admin for the WordPress dashboard.

#### Managing Data

* **Logs:** Use `docker-compose logs -f` to see activity.
* **Volumes:** files and database data are stored in `/home/tlecuyer/data/`. Even if you stop the containers.
---

#### Health Check

To verify everything is running correctly, use:
```bash
docker ps
```
You should see at least three containers with the status **"Up"** , and 8 with the bonuses.
---
