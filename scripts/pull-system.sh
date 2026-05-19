#!/usr/bin/env bash

cd /etc/nixos

git pull

git add .

sudo nixos-rebuild switch --flake /etc/nixos#nixos
