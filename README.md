## Omeka-S Docker Image

A [Docker](https://www.docker.com/) container for [Omeka S](https://github.com/omeka/omeka-s). It has no MySQL-Database included.

### Start in seconds
`docker run -d --name omeka_instance_name -p 8001:80 -v /path/to/your/custom/database.ini:/var/www/html/config/database.ini -v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock -v /path/to/save/omeka/files:/var/www/html/files boredland/omeka-s-docker`

### Explanation
In the example above `8001` is the port I like to serve omeka-s on. 

The first `/var/run/mysqld/mysqld.sock` is the hosts mysql-socket.

`/path/to/your/custom/database.ini` is a local file like [this](https://github.com/boredland/omeka-s-docker/blob/master/files/database.ini) on the host that contains the database credentials.

`/path/to/save/omeka/files` is the path where you'd like to save all your files on the host.

### Use
- Access the page on `http://localhost:[HTTP_PORT]/install`

### Notice
Omeka-S is not ready for production. For that reason I wanted to provide means to change your whole deployment against a new one without loosing files and database.

This project has been encouraged by [RAHLWES - HISTORICAL RESEARCH SERVICE](https://rahlwes.eu/).
