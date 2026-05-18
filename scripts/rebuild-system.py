#!/usr/bin/env python3

import os
import sys

def rebuild():
    print("executing NixOS Rebuild...")

    os.chdir("/etc/nixos")

    os.system("git add .")

    ret = os.system("sudo nixos-rebuild switch --flake /etc/nixos#nixos")

    version_mgmt()

    if ret == 0:
        print("system rebuilt successfully!")
    else:
        print("rebuild failed.")
        sys.exit(1)



def version_mgmt():
    with open("../version.txt", "r") as f:
        m_v, s_v = [int(v) for v in f.readline().strip().split(",")]
        s_v = s_v + 1 if s_v <= 9 else 0
        m_v = m_v if s_v != 0 else m_v + 1
        n_v = f"{m_v}.{s_v}"
        with open("../version.txt", "w") as m_f:
            m_f.write(n_v)

if __name__ == "__main__":
    rebuild()
