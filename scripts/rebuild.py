#!/usr/bin/env python3
import subprocess
import os
import sys

def rebuild():
    print("Executing NixOS Rebuild...")

    os.chdir("/etc/nixos")
    ret = subprocess.system("sudo nixos-rebuild switch --flake .#nixos")

    if ret == 0:
        print("System rebuilt successfully!")
    else:
        print("Rebuild failed.")
        sys.exit(1)

if __name__ == "__main__":
    rebuild()
