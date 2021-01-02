ARG DOCKER_VERSION

FROM nrchkb/node-red-homekit:$DOCKER_VERSION
LABEL mainteiner="Martin Blitz <martincblitz@gmail.com>"

USER root

RUN npm install node-red-contrib-home-assistant-websocket
RUN npm install node-red-contrib-alexa-home-skill
RUN npm install node-red-node-suncalc
RUN npm install node-red-dashboard
