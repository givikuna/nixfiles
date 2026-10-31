#!/usr/bin/env bash

curl -s https://api.github.com/users/givikuna | jq .id
