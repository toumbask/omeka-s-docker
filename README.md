## Omeka-S Docker Image

A [Docker](https://www.docker.com/) container for [Omeka S](https://github.com/omeka/omeka-s). It has no MySQL-Database included.

### Start in seconds
`docker run -d --name omeka_instance_name -p 8001:80 \
-v /path/to/your/custom/database.ini:/var/www/html/config/database.ini \
-v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock \
-v /path/to/save/omeka/files:/var/www/html/files boredland/omeka-s-docker`

### Setup
1. Clone this repository and navigate to it.

2. You'd have to edit `files/apache-config.conf` with your database-credentials (leave the localhost as-is, so we can connect via sockets).

3. Run 

    `docker build -t omeka .` 
    
    to build a Omeka-S Docker image. It'll take around 6 minutes on an average machine.

4. Run

    `docker run -d --name omeka_instance_name -p [HTTP_PORT]:80 -v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock -v /path/to/save/omekas/files:/var/www/html/files omeka`
    
    where `[HTTP_PORT]` is the port where you'd like to expose Omeka-S on...

### Use
- Access the page on `http://localhost:[HTTP_PORT]/install`

### Notice
Omeka-S is not ready for production. For that reason I wanted to provide measures to change your whole deployment against a new one without loosing files and database.

This project has been encouraged by [RAHLWES - HISTORICAL RESEARCH SERVICE](https://rahlwes.eu/).
