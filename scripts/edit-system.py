#!/usr/bin/env python3
import subprocess
import sys
import shutil
from pathlib import Path

CONFIG_DIR = Path("/etc/nixos")

def open_environment():
    if not CONFIG_DIR.exists():
        print(f"Error: Configuration directory '{CONFIG_DIR}' not found.")
        sys.exit(1)

    if not shutil.which("code"):
        print("Error: 'code' command not found.")
        print("Make sure VS Code is installed and 'code' is enabled in your environment.")
        sys.exit(1)

    print(f"Opening {CONFIG_DIR} in VS Code...")

    try:
        subprocess.Popen(
            ["code", str(CONFIG_DIR)],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )
        print("Environment opened successfully. Happy hacking!")
    except Exception as e:
        print(f"Failed to launch VS Code: {e}")
        sys.exit(1)

if __name__ == "__main__":
    open_environment()
