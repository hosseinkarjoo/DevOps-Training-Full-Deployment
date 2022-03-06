FROM alpine as BASE
RUN apk update && apk upgrade && apk add apache2

FROM BASE
WORKDIR /var/www/
RUN echo "salam" > index.html
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80
