FROM httpd
WORKDIR /var/www/html/
RUN echo "salam" > index.html
CMD ["/usr/sbin/httpd", "FOREGROUND"]
EXPOSE 80
