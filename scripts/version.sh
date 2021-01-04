#!/usr/bin/env bash

set -e
set -o pipefail

newVersion=$(awk -F. '{print $1"."$2"."$3+1}' < VERSION)
echo ${newVersion} > VERSION
git add VERSION
git commit -m "${newVersion}"
git tag "v${newVersion}"
echo "Bumped version to ${newVersion}"