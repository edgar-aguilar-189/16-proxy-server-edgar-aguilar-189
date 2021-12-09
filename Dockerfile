FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install sudo -y
RUN apt-get update && apt-get install vim -y
RUN apt-get install apache2-utils -y
RUN apt-get install net-tools -y
RUN apt-get install iputils-ping -y
RUN apt-get install curl -y
RUN apt-get install apache2 -y

RUN sudo adduser images
RUN sudo passwd -d images
RUN sudo usermod -aG sudo images

RUN a2enmod userdir
RUN a2enmod autoindex
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod alias
RUN sudo chmod -R 755 /var/www

RUN mkdir -p /home/images/public_html
COPY doggies.png /home/images/public_html
COPY skate.png /home/images/public_html
COPY gir.png /home/images/public_html

COPY site1.conf /etc/apache2/sites-available
COPY site2.conf /etc/apache2/sites-available
COPY site3.conf /etc/apache2/sites-available

RUN sudo mkdir -p /var/www//html/site1/public_html
COPY site1index.html /var/www/html/site1/public_html/index.html
RUN a2ensite site1.conf

RUN sudo mkdir -p /var/www/html/site2/public_html
COPY site2index.html /var/www/html/site2/public_html/index.html
RUN a2ensite site2.conf

RUN sudo mkdir -p /var/www/html/site3/public_html
COPY site3index.html /var/www/html/site3/public_html/index.html
RUN a2ensite site3.conf

RUN mkdir -p /etc/apache2/ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=US/ST=CA/O=MySite/CN=site1.internal" -newkey rsa:4096 -keyout /etc/apache2/ssl/site1.internal.key -out /etc/apache2/ssl/site1.internal.crt

Label Maintainer: "edgar.aguilar.189@my.csun.edu"
Expose 80
Expose 443
Expose 8443
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
