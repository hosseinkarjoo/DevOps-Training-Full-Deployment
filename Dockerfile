FROM alpine as BASE
RUN apk -y update && apk -y upgrade && apk -y install && systemctl strat httpd && systemctl enable httpd

FROM BASE
WORKDIR /var/www/
RUN echo "salam" > index.html
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80
