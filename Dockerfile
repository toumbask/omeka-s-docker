FROM tutum/apache-php:latest
MAINTAINER Lincoln Mullen <lincoln@lincolnmullen.com>
# Derived from Eric Rochester https://github.com/erochest/docker-omeka

RUN apt-get update && \
    apt-get -y install git ant openjdk-7-jdk
RUN cd / && rm -rf /app && git clone https://github.com/omeka/omeka-s.git /app
RUN a2enmod rewrite
RUN ant init
COPY ./files/database.ini /app/config/database.ini
COPY ./files/apache-config.conf /etc/apache2/sites-enabled/000-default.conf
RUN chmod -R +w /app/files

EXPOSE 80
WORKDIR /app
ADD . /app
CMD ["/run.sh"]
