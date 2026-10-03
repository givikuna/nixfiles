#!/usr/bin/env bash

cd /etc/nixos

git add .

nix flake update

nh os switch /etc/nixos -H $(hostname) --ask

sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)

# imperative unfortunatamente

raco pkg update --all

flatpak update -y
