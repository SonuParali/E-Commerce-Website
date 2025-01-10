# Used ubuntu as the base image
FROM ubuntu:latest

# Labels
LABEL "Author"="Soumyadeep"
LABEL "Project"="eCommerce"

# To execute the docker file wihout any fail or making it non interactive
ENV DEBIAN_FRONTEND=noninteractive

# Installing dependencies
RUN apt update && apt install apache2 && apt install git -y

# Command to keep the apache2 service running
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Command "Expose" for port forwarding
EXPOSE 80

# Setting up a default workdirectory
WORKDIR /var/www/html

# Taking up the logs
VOLUME /var/log/apache2

# To extract all the contents to "/var/www/html"
ADD FoodMart.tar.gz /var/www/html

# It will copy the "tar.gz" file into "/var/www/html"
# COPY FoodMart.tar.gz /var/www/html