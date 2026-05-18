#!/usr/bin/env bash

cd /etc/nixos

git add .

var=$(cat version.txt)
echo "$var"

git commit -m "version $var"

git push
