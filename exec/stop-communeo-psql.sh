#!/bin/bash

docker stop communeo-psql && docker rm $_
docker rmi ghcr.io/lincketheo/communeo-psql

