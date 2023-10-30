#!/bin/bash

# Get all repository branches
git fetch
branches=$(git branch --format='%(refname:short)')

# Bulking da git pull
for branch in $branches
do
  git checkout $branch
  git pull
done
