#!/usr/bin/env bash
set -euo pipefail

if ! echo "$KERNEL_PARAMS" | grep -q "split_lock_detect=off"; then
    echo "ERROR: split_lock_detect=off was not found in kernelParams!" >&2
    exit 1
fi

if [[ "$CPU_GOVERNOR" != "performance" ]]; then
    echo "ERROR: Expected CPU governor 'performance', found '$CPU_GOVERNOR'" >&2
    exit 1
fi

echo "Kernel parameters and CPU governor verified successfully."
