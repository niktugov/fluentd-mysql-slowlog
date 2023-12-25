FROM fluent/fluentd:v1.16-1

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo fluent-gem install fluent-plugin-mysqlslowquery \
 && sudo fluent-gem install fluent-plugin-kafka \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

RUN apk add --no-cache tzdata
ENV TZ=Europe/Moscow
