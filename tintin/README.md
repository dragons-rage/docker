# TinTin

## Getting
git clone https://github.com/dstritzel/docker.git

## Installing
Ensure Docker is on your system and do the following and you are in the docker directory.

```bash
cd tintin && ./build-tintin.sh
```

## Running

run `run-tintin.sh` or
```bash
docker run -it --name tintin tintin
```

## Altnernative Method of building

```bash
docker build -t tintin https://github.com/dstritzel/docker.git\#master/tintin
```

Docker Modules to assist in daily one off programs

## TODO
* Remap the .tintin directory to a static volume. We don't want to loose all those macros.
* Make a tt++ binary for alpine to reduce the need for extra crap in the images.
* Reduce need for make g++ and dev libraries to reduce space. Adhoc to previous todo.
