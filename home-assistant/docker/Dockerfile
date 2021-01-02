ARG HA_VERSION

FROM homeassistant/home-assistant:$HA_VERSION
LABEL mainteiner="Martin Blitz <martincblitz@gmail.com>"

USER root

RUN apk add --no-cache patch

RUN rm -rf /usr/src/homeassistant/homeassistant/__pycache__

COPY elkm1.patch /

RUN cd /usr/src/homeassistant ; patch -p1 < /elkm1.patch
