FROM mcr.microsoft.com/devcontainers/dotnet:8.0-noble

# Install additional packages
RUN \
    curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
    --dearmor && \
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list && \
    sudo apt-get update && \
    sudo apt-get install -y mongodb-org && mkdir -p /data/db


RUN echo "sudo mongod --logpath /var/log/mongod.log --fork" >> /etc/init.d/mongod.sh && chmod 755 /etc/init.d/mongod.sh
USER vscode
ENTRYPOINT [ "/bin/bash" ]
CMD [ "-c", "/etc/init.d/mongod.sh;echo Container started\ntrap \"exit 0\" 15\n\nexec \"$@\"\nwhile sleep 1 & wait $!; do :; done", "-" ]