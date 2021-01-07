#!/usr/bin/env bash

if [ -z "$1" ]; then
  >&2 echo "Usage: image_id.sh github_repository"
  exit 1
fi

# `zixia/docker-apache-php56` -> `zixia/apache-php56`
IMAGE_ID=$(echo $1 | sed 's/\/docker-/\//')
# Change all uppercase to lowercase
IMAGE_ID=$(echo $IMAGE_ID | tr '[A-Z]' '[a-z]')
IMAGE_ID=ghcr.io/"$IMAGE_ID"

echo $IMAGE_ID
