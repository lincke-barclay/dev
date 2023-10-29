#!/bin/bash

docker stop communeo-api && docker rm $_
docker rmi ghcr.io/lincketheo/communeo-api

