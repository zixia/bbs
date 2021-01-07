#!/usr/bin/env bash

if [ -z "$1" -o -z "$2" ]; then
  >&2 echo "Usage: image_tag.sh <version> <branch>"
  exit 1
fi

VERSION=$1
BRANCH=$2

VERSION_MAJOR=$(echo "$VERSION" | cut -d. -f1)
VERSION_MINOR=$(echo "$VERSION" | cut -d. -f2)

VERSION_TAG="${VERSION_MAJOR}.${VERSION_MINOR}"

if [ $BRANCH == 'main' -o $BRANCH == 'master' ]; then
  if [ $((VERSION_MINOR % 2)) == 0 ]; then
    BRANCH_TAG=latest
  else
    BRANCH_TAG=next
  fi
fi

echo "$VERSION_TAG" "$BRANCH_TAG"
