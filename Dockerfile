FROM alpine as BASE
RUN apt update -y && apt upgrade -y && apt install httpd && systemctl strat httpd && systemctl enable httpd

FROM BASE
WORKDIR /var/www/
RUN echo "salam" > index.html
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80
