#!/command/with-contenv bash

ACCESS_TOKEN=$ACCESS_TOKEN
OWNER=$OWNER
REPOSITORY=$REPOSITORY

REG_TOKEN=$(curl -X POST -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $ACCESS_TOKEN" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/$OWNER/$REPOSITORY/actions/runners/registration-token | jq .token --raw-output)

cd /home/docker/actions-runner

./config.sh --url https://github.com/$OWNER/$REPOSITORY --token ${REG_TOKEN}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!