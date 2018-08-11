FROM node:8-alpine

MAINTAINER Michael Parker, <docker@parkervcp.com>

ENV DAEMON_VERSION=v0.6.3

WORKDIR /srv/daemon

RUN apk add --no-cache openssl make gcc g++ python linux-headers paxctl gnupg tar zip unzip coreutils zlib \
 && wget https://github.com/Pterodactyl/Daemon/releases/download/${DAEMON_VERSION}/daemon.tar.gz \
 && tar --strip-components=1 -xzvf daemon.tar.gz \
 && rm daemon.tar.gz \
 && npm install --production \
 && addgroup -S pterodactyl && adduser -S -D -H -G pterodactyl -s /bin/false pterodactyl \
 && apk del --no-cache make gcc g++ python linux-headers paxctl gnupg

EXPOSE 8080

CMD ["npm", "start"]
