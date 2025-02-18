# TinTin

## Getting
git clone https://github.com/dstritzel/docker.git

## Installing
Ensure Docker is on your system and do the following and you are in the docker directory.

## Running

```bash
docker run -it --name tintin -v ${PWD}/config:/config faliarin/tintin:latest
```

Add --rm if you want to remove the container after you are complete.

Default location for tintin config file will be in /config/run.tin. This can be overriden by using the CONFIG_FILE environemt vaiable.

## Altnernative Method of building

```bash
docker build -t tintin https://github.com/dstritzel/docker.git\#master/tintin
```

Docker Modules to assist in daily one off programs

## TODO
* Remap the .tintin directory to a static volume. We don't want to loose all those macros.
* Make a tt++ binary for alpine to reduce the need for extra crap in the images.
* Reduce need for make g++ and dev libraries to reduce space. Adhoc to previous todo.
* Config file templates to execute of first run.
* Ability to override s6-overlay stuff.
