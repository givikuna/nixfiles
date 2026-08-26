#!/usr/bin/env bash

cd /etc/nixos

git add .

nix flake update

sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)

# imperative unfortunatamente

raco pkg update --all

flatpak update -y
