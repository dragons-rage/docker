# TinTin

## Description

Note: I do not actively use right now, however it takes little effort to update.

Tintin++ is a MUD(Multi User Dungeon) client.
This is a docker container has precompiled binaries and works
on anything with a linux container runner. Should work on x86_64 and arm systems.

## Installing

Ensure Docker is on your system and do the following and you are in the docker directory.

## Running

```bash
docker run -it --name tintin -v ${PWD}/config:/config faliarin/tintin:latest
```

Add --rm if you want to remove the container after you are complete.

Default location for tintin config file will be in /config/run.tin.
This can be overriden by using the CONFIG_FILE environemt vaiable.

## Altnernative Method of building

```bash
docker build -t tintin https://github.com/dstritzel/docker.git\#master/tintin
```

Docker Modules to assist in daily one off programs

## TODO

* Remap the .tintin directory to a static volume.
  We don't want to loose all those macros.
* Make a tt++ binary for alpine to reduce the need for extra crap in the images.
  Right now the src and build extras are installed.
* Reduce need for make g++ and dev libraries to reduce space. Adhoc to previous todo.
* Config file templates to execute of first run. Maybe add a mud or first config.
* Test all features and add needed packages for external scripting
  (i.e. Perl, Python, Lua) (Portable installs for optional additions)
* Add a container start script that uses packages.json or other items to install
  scripting packages. (i.e. pip requirements). Make optional containers?

## Links

* [tintin++](https://github.com/scandum/tintin)
