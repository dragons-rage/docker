#!/bin/sh
# Grab Tintin source
USER=tintin

wget -L -O /tmp/tintin.tar.gz \
  "https://github.com/scandum/tintin/releases/download/${TINTIN_VERSION}/tintin-${TINTIN_VERSION}.tar.gz"

cd /tmp
mkdir /config
adduser -D $USER
echo "$USER ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/$USER
chmod 0440 /etc/sudoers.d/$USER
chown -R $USER /config
tar -xf tintin.tar.gz

cd tt/src
./configure && make && make install

cd /tmp

rm -rf tintin.tar.gz tt
