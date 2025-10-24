# Dockerfile (basic)
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y apache2 mysql-server && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 80 3306

# Start mysql (service) then run apache in foreground so container stays alive
CMD service mysql start && apachectl -D FOREGROUND
