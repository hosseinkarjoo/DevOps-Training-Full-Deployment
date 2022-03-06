FROM httpd
WORKDIR /var/www/html/
RUN echo "salam" > index.html
EXPOSE 80
