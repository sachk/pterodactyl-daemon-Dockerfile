## Pterodactyl Daemon Dockerfile

A container for the pterodactyl daemon utilizing Alpine Linux and multi-stage builds.

Based on [parkervcp's image](https://github.com/parkervcp/pterodactyl-daemon-Dockerfile).

#### This branch utilises automatically updated images built using Travis, and is not as stable as the other branches

## Running with docker-compose (Recommended)

*This container requires a host running a recent version of docker and docker-compose*

First, edit the docker-compose.yml file to reflect your setup

In particular, change the **ports** and **volumes** sections


```
ports:
- "8080:8080"
- "2022:2022"
...
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- /tmp/pterodactyl/:/tmp/pterodactyl
- ./daemon/config/:/srv/daemon/config/
- ./daemon-data/:/srv/daemon-data/
```


Then, you can start the daemon using 
```
$ docker-compose up -d
```

### Fetching the daemon config automatically

Run this command replacing <panel_url> and <panel_token> with the URL and token from pressing the "Generate Token" button.
```
$ docker-compose run daemon npm run configure -- --panel-url <panel_url> --token <panel_token>
```

![Example Generate Token](https://github.com/sachk/pterodactyl-daemon-Dockerfile/blob/0.6.X/token.png "Example Generate Token")

## Running with just Docker

If you don't want to or can't install docker-compose you can run this daemon using a single docker command however, this isn't recommended as it's much easier to make mistakes in the syntax.

```
docker run --name pterodactyl-daemon -d -t -p 2022:2022 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v /tmp/pterodactyl/:/tmp/pterodactyl -v ./daemon/config/:/srv/daemon/config/ -v ./daemon-data/:/srv/daemon-data/ sachk/pterodactyl-daemon
```

You can also fetch the daemon config automatically as such following the same variables as above.

```
docker exec -it pterodactyl-daemon npm run configure -- --panel-url <panel_url> --token <panel_token>
```
