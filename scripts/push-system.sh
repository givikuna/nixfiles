#!/usr/bin/env bash

cd /etc/nixos

git add .

read -p "choose version name: " VERSION_NAME

git commit -m "$VERSION_NAME"

git push
