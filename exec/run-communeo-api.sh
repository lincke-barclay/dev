#!/bin/bash

docker stop communeo-api && docker rm $_
docker rmi ghcr.io/lincketheo/communeo-api

source /home/communeo/env.sh

docker pull ghcr.io/lincketheo/communeo-api:latest

docker run \
	-v /home/communeo/credentials:/app/credentials \
	-p 8000:$PORT \
	-e PORT=$PORT \
	-e FIREBASE_API_KEY=$FIREBASE_API_KEY \
	-e FIREBASE_AUTH_DOMAIN=$FIREBASE_AUTH_DOMAIN \
	-e FIREBASE_PROJECT_ID=$FIREBASE_PROJECT_ID \
	-e FIREBASE_STORAGE_BUCKET=$FIREBASE_STORAGE_BUCKET \
	-e FIREBASE_MESSAGING_SENDER_ID=$FIREBASE_MESSAGING_SENDER_ID \
	-e FIREBASE_APP_ID=$FIREBASE_APP_ID \
	-e FIREBASE_MEASUREMENT_ID=$FIREBASE_MEASUREMENT_ID \
	-e GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS \
	-e POSTGRES_USERNAME=$POSTGRES_USER \
	-e POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
	-e POSTGRES_DB_NAME=$POSTGRES_DB \
	-e POSTGRES_DB_HOST=$POSTGRES_HOST \
	--name communeo-api \
	ghcr.io/lincketheo/communeo-api \
