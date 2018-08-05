Fork of [parkervcp's image](https://github.com/parkervcp/pterodactyl-daemon-Dockerfile) with a version bump.

I might change more things in the future.

# Fetch daemon config automatically
```
$ docker-compose run daemon npm run configure -- --panel-url <panel_url> --token <panel_token>
```