FROM homeassistant/home-assistant:0.111.4
LABEL mainteiner="Martin Blitz <martincblitz@gmail.com>"

USER root

COPY elkm1.patch /

RUN cd /usr/src/homeassistant ; patch -p1 < /elkm1.patch
