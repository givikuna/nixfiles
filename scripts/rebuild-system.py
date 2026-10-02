#!/usr/bin/env python3

import os
import sys
import socket
import subprocess

def print_msg(msg, color_code="34"):
    print(f"\n\033[1;{color_code}m✦ {msg}\033[0m\n")

def rebuild():
    flake_dir = "/etc/nixos"
    hostname = socket.gethostname()

    print_msg("staging", "33")

    try:
        os.chdir(flake_dir)
    except FileNotFoundError:
        print_msg(f"could not find flake directory: {flake_dir}", "31")
        sys.exit(1)

    subprocess.run(["git", "add", "."], check=True)

    print_msg(f"starting rebuild for {hostname}", "36")

    nh_cmd = ["nh", "os", "switch", flake_dir, "-H", hostname, "--ask"]
    # os.system(f"sudo nixos-rebuild switch --flake /etc/nixos#{socket.gethostname()}")

    try:
        subprocess.run(nh_cmd, check=True)

        # print_msg("running gitboy", "33")
        subprocess.run(["gitboy"], check=False)

        print_msg("system rebuilt successfully!", "32")

    except subprocess.CalledProcessError:
        print_msg("rebuild failed.", "31")
        sys.exit(1)

    except KeyboardInterrupt:
        print_msg("rebuild cancelled.", "33")
        sys.exit(130)

if __name__ == "__main__":
    rebuild()
