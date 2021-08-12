FROM ubuntu:latest
LABEL maintainer="Martin Blitz <mcblitz@verizon.net>"

##################
##   BUILDING   ##
##################

WORKDIR /

RUN apt update
RUN apt upgrade -y

# Prerequisites

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN apt-get install -y nodejs git
RUN git clone git@github.com:tagyoureit/nodejs-poolController.git
RUN cd nodejs-poolcontroller
RUN npm install

EXPOSE 4200

VOLUME [""]

CMD ["cd /nodejs-poolcontroller ; npm start"]
