FROM homeassistant/home-assistant:stable
LABEL mainteiner="Martin Blitz <martincblitz@gmail.com>"

USER root

COPY elkm1.patch /

RUN cd /usr/src/homeassistant ; patch -p1 < /elkm1.patch
