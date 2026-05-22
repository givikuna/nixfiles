#!/usr/bin/env python3

import os
import sys
import socket

def rebuild():
    print("executing NixOS Rebuild...")

    os.chdir("/etc/nixos")

    os.system("git add .")

    ret = os.system(f"sudo nixos-rebuild switch --flake /etc/nixos#{socket.gethostname()}")

    if ret == 0:
        print("system rebuilt successfully!")
    else:
        print("rebuild failed.")
        sys.exit(1)

if __name__ == "__main__":
    rebuild()
