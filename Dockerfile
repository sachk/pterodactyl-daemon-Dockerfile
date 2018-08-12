FROM node:8-alpine as builder

WORKDIR /srv/daemon

RUN apk add --no-cache --update jq curl wget ca-certificates openssl make gcc g++ python linux-headers paxctl gnupg tar zip unzip coreutils zlib

# aaaaaaah
RUN DAEMON_VERSION=$(curl -s 'https://api.github.com/repos/pterodactyl/daemon/releases/latest' | jq -r '.tag_name') \
 && wget https://github.com/Pterodactyl/Daemon/releases/download/${DAEMON_VERSION}/daemon.tar.gz \
 && tar --strip-components=1 -xzvf daemon.tar.gz \
 && rm daemon.tar.gz \
 && npm install --production

FROM mhart/alpine-node:base-8

COPY --from=builder /srv/daemon /srv/daemon/

RUN apk add --no-cache --update openssl tar zip unzip zlib \
 && addgroup -S pterodactyl && adduser -S -D -H -G pterodactyl -s /bin/false pterodactyl

EXPOSE 8080

WORKDIR /srv/daemon

CMD ["sh", "-c", "node src/index.js | node_modules/bunyan/bin/bunyan -o short"]
