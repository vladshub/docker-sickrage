FROM vladshub/python-virtualenv
MAINTAINER Vladislav Shub <vlad6il@gmail.com>

RUN apk add --no-cache --update libffi-dev py-imaging && rm -rf /var/cache/apk/*

EXPOSE 8081
COPY ./entrypoint.sh /

ENV SICKRAGE_VERSION 7.0.22

RUN wget -q "https://github.com/SickRage/SickRage/archive/2016.03.10-1.tar.gz" \
  && tar xzf *.tar.gz && rm *.tar.gz \
  && mv SickRage-* /sickrage

RUN virtualenv /env

WORKDIR /sickrage

#RUN . /env/bin/activate \
#  && /env/bin/pip install git+https://github.com/sebastiaansamyn/python-fanart \
#  && /env/bin/pip install --upgrade dogpile.cache \
#  && /env/bin/pip install --upgrade configobj \
#  && /env/bin/pip install --upgrade -r sickrage/requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
