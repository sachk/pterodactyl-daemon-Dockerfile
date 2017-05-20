FROM node:7.10.0-alpine

MAINTAINER Michael Parker, <docker@parkervcp.com>

WORKDIR /srv/daemon

RUN apk update \
 && apk add openssl make gcc g++ python linux-headers paxctl gnupg tar zip unzip coreutils \
 && wget https://github.com/Pterodactyl/Daemon/archive/v0.4.0.tar.gz \
 && tar --strip-components=1 -xzvf v0.4.0.tar.gz \
 && npm install --production \
 && apk del curl make gcc g++ python linux-headers paxctl gnupg tar ${DEL_PKGS}

EXPOSE 8080

CMD ["npm", "start"]
