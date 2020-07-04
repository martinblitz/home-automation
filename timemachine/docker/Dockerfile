FROM ubuntu:latest
LABEL maintainer="Martin Blitz <mcblitz@verizon.net>"

##################
##   BUILDING   ##
##################

WORKDIR /

# Prerequisites
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y samba

RUN mkdir -p /timemachine

EXPOSE 548 636

VOLUME ["/timemachine"]

CMD ["/entrypoint.sh"]
