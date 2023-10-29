#!/bin/bash

source /home/communeo/env.sh
echo $GH_TOKEN
docker login --username lincketheo --password $GH_TOKEN ghcr.io
