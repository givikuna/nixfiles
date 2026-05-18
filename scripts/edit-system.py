#!/usr/bin/env python3

import subprocess
import sys
import shutil
from pathlib import Path

CONFIG_DIR = Path("/etc/nixos")

def open_environment():
    if not CONFIG_DIR.exists():
        print(f"error: Configuration directory '{CONFIG_DIR}' not found.")
        sys.exit(1)

    if not shutil.which("code"):
        print("error: 'code' command not found.")
        print("make sure vscode or codium or code oss is installed and 'code' is enabled in your environment.")
        sys.exit(1)

    print(f"opening {CONFIG_DIR} in VS Code...")

    try:
        subprocess.Popen(
            ["code", str(CONFIG_DIR)],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
        print("environment editing started successfully.")
        print("be careful.")
    except Exception as e:
        print(f"failed to launch VS Code: {e}")
        sys.exit(1)

if __name__ == "__main__":
    open_environment()
