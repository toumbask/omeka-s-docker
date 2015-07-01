OMEKA_TAG=lmullen/omeka-s
OMEKA_NAME=omeka

MYSQL_TAG=mysql
MYSQL_NAME=omeka-mysql
MYSQL_ROOT_PASS=rootpass
MYSQL_DATABASE=omeka
MYSQL_USER=omeka
MYSQL_PASSWORD=omeka

LOCAL_PORT=8888
LOCAL_MYSQL_DATA=

build:
	docker build -t ${OMEKA_TAG} .

run:
	docker run --name ${MYSQL_NAME} \
		-e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASS} \
		-e MYSQL_DATABASE=${MYSQL_DATABASE} \
		-e MYSQL_USER=${MYSQL_USER} \
		-e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
		$(if $(LOCAL_MYSQL_DATA), -v ${LOCAL_MYSQL_DATA}:/var/lib/mysql) \
		-d mysql
	docker run -d -p ${LOCAL_PORT}:80 --link ${MYSQL_NAME}:mysql --name ${OMEKA_NAME} ${OMEKA_TAG}

stop:
	docker stop ${OMEKA_NAME}
	docker stop ${MYSQL_NAME}

start:
	docker start ${MYSQL_NAME}
	docker start ${OMEKA_NAME}

clean: stop
	docker rm ${OMEKA_NAME}
	docker rm ${MYSQL_NAME}

distclean: clean
	docker rmi ${OMEKA_TAG}

rebuild:
	make distclean
	make build
	make run

.PHONY: build run stop start clean distclean rebuild 

