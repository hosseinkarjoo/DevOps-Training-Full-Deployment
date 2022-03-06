FROM alpine as BASE
RUN yum update -y && yum upgrade -y && yum install httpd && systemctl strat httpd && systemctl enable httpd

FROM BASE
WORKDIR /var/www/
RUN echo "salam" > index.html
CMD [“/usr/sbin/httpd”, “-D”, “FOREGROUND”]
EXPOSE 80
