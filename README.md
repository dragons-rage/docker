# docker
Docker Modules to assist in daily one off programs.

## Programs
| Container | Description |
|-----------|-------------|
| alpine-core | Modified alpine core for any hub items used in this repo |
| ubuntu-core | Modified ubuntu TLS for any Docker items used in this repo |
| goodsync   | Docker Container for goodsync usage |
| tintin      | A program that allows for connecting to MUDs (Text Based Multi User Dungeons) |


## Building
You can build from the github repo sub directories by specifing the branch and directory

Example:
```bash
git build -t tintin https://github.com/dstritzel/docker.git\#master/tintin
```

In the example replace `tintin` with the tag and project of your choice.

