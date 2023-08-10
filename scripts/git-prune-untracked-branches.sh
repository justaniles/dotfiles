#!/usr/bin/env bash

git fetch -p --quiet
old_ifs=$IFS
IFS=$'\n'

branchesWithGoneRemote=$(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}')
branchesWithNoRemote=$(git branch --format "%(refname:short) %(upstream)" | awk '{if (!$2) print $1;}')
branchesToPrune=$((echo "$branchesWithGoneRemote"; echo "$branchesWithNoRemote") | sort)

branchCount=0
branchStr="Prune below branches which have no remote?"
for branch in $branchesToPrune; do
  ((branchCount+=1))
  branchStr+=$'\n'"  - ${branch}"
done

if (( $branchCount > 0 )); then
  echo "$branchStr"
  read -p "[Y/N]? " yn
  if [[ $yn =~ ^[Yy]$ ]]; then
    deletedBranchCount=0
    for branch in $branchesToPrune; do
      if git branch -D $branch; then
        ((deletedBranchCount+=1))
      fi
    done
    echo "✅ Deleted $deletedBranchCount branches."
  fi
else
  echo "No branches to prune."
fi

IFS=$old_ifs