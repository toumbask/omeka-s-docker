## Omeka-S Docker Image

A [Docker](https://www.docker.com/) container for [Omeka S](https://github.com/omeka/omeka-s). Adapted from [Eric Rochester's Docker container](https://github.com/erochest/docker-omeka) for Omeka 2.x.

### Use

Clone this repository and navigate to it. Run `make build` to build the Omeka S image for Docker. Then run `make run` to run the Omeka container and an associated MySQL container. The commands `make stop` and `make start` will stop and restart the containers, and `make clean` will stop and destroy the containers. To install Omeka, navigate to the `install` path on your Docker IP address and port number. On my system, that is `http://192.168.59.104:8888/install`

To configure container names and the MySQL database names, edit the variables in `Makefile`.

If you want the MySQL database to persist even after the containers have been destroyed and restarted, then you need to define provide an absolute path to the `LOCAL_MYSQL_DATA` variable in the `Makefile`. On Linux, any path should do. On Mac when using [boot2docker](http://boot2docker.io/) there is a known permissions problem when passing paths that begin with `/Users/`; the MySQL container will not be able to create a database. If you want the data to persist on a Mac, then it will have to stored in the boot2docker image by defining, for example, `LOCAL_MYSQL_DATA=/omeka-data`.

