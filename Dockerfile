FROM fluentd
USER root
RUN [" /opt/td-agent/embedded/bin/fluent-gem", "install", "fluent-plugin-elasticsearch", "--no-document"]
#RUN apk add --no-cache --update --virtual .build-deps \
#        sudo build-base ruby-dev \
# && sudo /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-elasticsearch \
# && sudo gem sources --clear-all \
# && apk del .build-deps \
# && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
 
USER fluent


