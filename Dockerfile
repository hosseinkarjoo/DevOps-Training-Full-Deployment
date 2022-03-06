FROM alpine as BASE
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install && systemctl strat httpd && systemctl enable httpd

FROM BASE
WORKDIR /var/www/
RUN echo "salam" > index.html
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80
