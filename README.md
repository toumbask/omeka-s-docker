## Omeka-S Docker Image

A [Docker](https://www.docker.com/) container for [Omeka S](https://github.com/omeka/omeka-s). It has no MySQL-Database included.

### Setup
1. Clone this repository and navigate to it.

2. You'd have to edit `files/apache-config.conf` with your database-credentials (leave the localhost as-is, so we can connect via sockets).

3. Run 

    `docker build -t omeka .` 
    
    to build a Omeka-S Docker image. It'll take around 6 minutes on an average machine.

4. Run

    `docker run -d --name docker_instance_name -p [HTTP_PORT]:80 -v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock -v /path/to/save/omekas/files:/var/www/html/files omeka`
    
    where `[HTTP_PORT]` is the port where you'd like to expose Omeka-S on and `[MYSQL_PORT]` is the port via which your MySQL-Database is running on.

### Use
- Access the page on `http://localhost:[HTTP_PORT]/install`