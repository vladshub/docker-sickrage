FROM vladshub/python-virtualenv
MAINTAINER Vladislav Shub <vlad6il@gmail.com>

RUN apk add --no-cache --update libffi-dev py-imaging && rm -rf /var/cache/apk/*

EXPOSE 8081
COPY ./entrypoint.sh /

ENV SICKRAGE_VERSION 2016.04.28-1

RUN wget -q "https://github.com/SickRage/SickRage/archive/${SICKRAGE_VERSION}.tar.gz" \
  && tar xzf *.tar.gz && rm *.tar.gz \
  && mv SickRage-* /sickrage

RUN virtualenv /env

WORKDIR /sickrage

ENTRYPOINT ["/entrypoint.sh"]
