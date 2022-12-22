## Rebuild of goodsync

Uses ubuntu-core and s6-overlay to run the goodsync.

WARNING: This does not do well as a swarm service or without a --name set on a container. It will randomly generate a hostname and googsync's licensing server will treat it as a new computer. This will either not assign a license or use unecessary. There may be ways around this by passing a HOSTNAME environment variable in the run script. This fix is not in this implementation yet as we have not tested it.


Versioning is based on my build version and not the goodsync version. This is on the todo list.

A username and password is required and must be set during first run.
Secrets must be set in the docker swarm to use them. 

```
GS_USERNAME - Used if GS_USER_SECRET or GS_PASS_SECRET is not set
GS_PASSWORD - Used if GS_USER_SECRET or GS_PASS_SECRET is not set
or
GS_USER_SECRET - Uses secrets from /run/secrets/${GS_USER_SECRET}
GS_PASS_SECRET - Uses secrets from /run/secrets/${GS_PASS_SECRET}
```