# Variscite Yocto Builder

## Set Up Env

1. Install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) with Ubuntu (not needed since you can run docker on Windows)
2. Install [Docker](https://docs.docker.com/engine/install/ubuntu/)
   - Add your user to the Docker group: `sudo usermod -aG $USER docker` and restart your terminal
3. Build the container: `docker build --no-cache --progress=plain -t var-yocto .`
4. Log into the system and do initial setup:
   1. Host: `mkdir -p var-yocto && docker run --mount source=$(pwd)/var-yocto,target=/opt/repo/var-yocto,type=bind -it var-yocto`
   2. Within Container: `./init-repo.sh "Your Name" "your.email@whatever.com"`

## Building

Log into the system: `docker run --mount source=$(pwd)/var-yocto,target=/opt/repo/var-yocto,type=bind -it var-yocto` then run `./build.sh`

## Delete Everything

```bash
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)
rm -rf repo
```
