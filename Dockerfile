FROM node:7.10.0-alpine

MAINTAINER Michael Parker, <docker@parkervcp.com>

ENV DAEMON_VERSION=v0.4.2

WORKDIR /srv/daemon

RUN apk update \
 && apk add openssl make gcc g++ python linux-headers paxctl gnupg tar zip unzip coreutils \
 && wget https://github.com/Pterodactyl/Daemon/archive/${DAEMON_VERSION}.tar.gz \
 && tar --strip-components=1 -xzvf ${DAEMON_VERSION}.tar.gz \
 && npm install --production \
 && apk del curl make gcc g++ python linux-headers paxctl gnupg tar ${DEL_PKGS}

EXPOSE 8080

CMD ["npm", "start"]
