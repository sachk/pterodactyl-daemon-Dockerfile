# Pterodactyl Daemon Dockerfile

A container for the pterodactyl daemon utilizing Alpine Linux and multi-stage builds.

Based on [parkervcp's image](https://github.com/parkervcp/pterodactyl-daemon-Dockerfile).

Three different branches are available, with different strengths and weaknesses. 

# Branches

## [Travis](https://github.com/sachk/pterodactyl-daemon-dockerfile/tree/travis)

This branch contains a docker-compose file and documentation for always up to date images built via travis based on the mini branch. These aren't tested so proceed with caution.

## [Mini](https://github.com/sachk/pterodactyl-daemon-dockerfile/tree/mini)

This branch contains a smaller version without npm installed based on mhart's node-alpine base images.

## 0.X.X

These are standard, stable branches very simular to [parkervcp's image](https://github.com/parkervcp/pterodactyl-daemon-Dockerfile).
