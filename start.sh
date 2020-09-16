#!/bin/bash

VOLUMES_DIR=/opt/docker-$(whoami)/vestacp

mkdir -p $VOLUMES_DIR/{vesta,home,backup}

./stop.sh

#                                         ssh        http       https       vesta frontend
docker run -d --restart=unless-stopped -p 3322:22 -p 3380:80 -p 3343:443 -p 8083:8083 \
-v $VOLUMES_DIR/vesta:/vesta -v $VOLUMES_DIR/home:/home -v $VOLUMES_DIR/backup:/backup -v $(pwd):/pwd \
--name vesta-docker \
niiknow/vestacp

docker exec -it vesta-docker apt-get install -y jq

# start shell
docker exec -it vesta-docker /bin/bash