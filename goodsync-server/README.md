## Rebuild of goodsync

Uses ubuntu-core and s6-overlay to run the goodsync.


A username and password is required and must be set during first run.
Secrets must be set in the docker swarm to use them. 

```
GS_USERNAME - Used if GS_USER_SECRET or GS_PASS_SECRET is not set
GS_PASSWORD - Used if GS_USER_SECRET or GS_PASS_SECRET is not set
or
GS_USER_SECRET - Uses secrets from /run/secrets/${GS_USER_SECRET}
GS_PASS_SECRET - Uses secrets from /run/secrets/${GS_PASS_SECRET}
```