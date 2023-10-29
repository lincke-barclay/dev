#!/bin/bash

docker stop communeo-psql && docker rm $_
docker rmi ghcr.io/lincketheo/communeo-psql

source /home/communeo/env.sh

docker pull ghcr.io/lincketheo/communeo-psql:latest

docker run --name communeo-psql \
        -v $POSTGRES_DATA_DIR:/var/lib/postgresql/data \
        -e POSTGRES_USER=$POSTGRES_USER \
        -e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
        -e POSTGRES_DB=$POSTGRES_DB \
        -p 5432:5432 \
	--name communeo-psql \
	ghcr.io/lincketheo/communeo-psql 
