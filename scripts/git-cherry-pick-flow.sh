#!/usr/bin/env bash

set -e

if [ "$1" = '-h' -o $# -lt 2 ]; then
  echo 'Usage: git-cherry-pick <targetBranch> <commitToCherryPick>'
  exit 1
fi

randomStr=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
cherryBranch="justin/cherry-$1_$randomStr"

echo "Okay to reset --hard? $1 --> origin/$1"
read -p "[Y/N]? " yn
if [[ $yn =~ ^[Yy]$ ]]; then
  git checkout $1
  git fetch origin $1
  git reset --hard "origin/$1"
  git checkout -b "$cherryBranch"
  git cherry-pick -x $2

  echo ''
  echo "✅ Commit $2 cherry-picked to $1. Ready to push $cherryBranch."
fi
