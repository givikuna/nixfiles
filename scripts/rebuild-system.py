#!/usr/bin/env python3

import os
import sys
import socket
import subprocess

def print_msg(msg, color_code="34"):
    print(f"\n\033[1;{color_code}m✦ {msg}\033[0m\n")

def rebuild(use_nh=False):
    flake_dir = "/etc/nixos"
    hostname = socket.gethostname()

    print_msg("staging", "33")

    try:
        os.chdir(flake_dir)
    except FileNotFoundError:
        print_msg(f"could not find flake directory: {flake_dir}", "31")
        sys.exit(1)

    subprocess.run(["git", "add", "."], check=True)

    if use_nh:
        rebuild_cmd = ["nh", "os", "switch", flake_dir, "-H", hostname, "--ask"]
        tool = "nh"
    else:
        rebuild_cmd = ["sudo", "nixos-rebuild", "switch", "--flake", f"{flake_dir}#{hostname}"]
        tool = "nixos-rebuild"

    print_msg(f"starting rebuild for {hostname} using {tool}", "36")

    try:
        subprocess.run(rebuild_cmd, check=True)

        subprocess.run(["gitboy"], check=False)
        print_msg("system rebuilt successfully!", "32")

    except subprocess.CalledProcessError:
        print_msg("rebuild failed.", "31")
        sys.exit(1)

    except KeyboardInterrupt:
        print_msg("rebuild cancelled.", "33")
        sys.exit(130)


def main():
    args = sys.argv[1:]
    use_nh = False

    for arg in args:
        if arg in ("-nh", "--nh"):
            use_nh = True
        elif arg in ("-h", "--help"):
            print("usage: rebuild-system [-nh|--nh]")
            print()
            print("  (no args)   use nixos-rebuild switch")
            print("  -nh, --nh   use nh os switch")
            return
        else:
            print_msg(f"unknown argument: {arg}", "31")
            sys.exit(2)

    rebuild(use_nh=use_nh)


if __name__ == "__main__":
    main()
