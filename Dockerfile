FROM httpd
WORKDIR /var/www/html/
RUN rm -rf ./index.html
RUN echo "salam" > ./index.html
RUN systemctl restart httpd
EXPOSE 80
