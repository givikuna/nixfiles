#!/usr/bin/env elvish

use os

var config-dir = /etc/nixos

fn open-env {
    if (not (os:exists $config-dir)) {
        echo "error: config dir '"$config-dir"' not found."
        exit 1
    }

    if (not (has-external code)) {
        echo "error: 'code' command not found."
        echo "make sure vscode or codium or code oss is installed"
        exit 1
    }

    echo "opening "$config-dir" in vscode..."

    code $config-dir > /dev/null 2>&1 &
    echo "tread carefully"
}

open-env
