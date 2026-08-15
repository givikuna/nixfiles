#!/usr/bin/env bash
# Agent: @AGENT@

RO_DIRS="@RO_DIRS@"
DOMAINS="@DOMAINS@"

write_dirs=()
args=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        --write)
            shift
            write_dirs+=("$1")
            shift
            ;;
        --help)
            echo "Usage: $0 [--write <path>] [-- <ollama-args>]"
            echo "  --write : path(s) to make writable inside the sandbox"
            exit 0
            ;;
        *)
            args+=("$1")
            shift
            ;;
    esac
done

IFS=':' read -ra ro_dirs <<< "$RO_DIRS"

cmd=(
    @BWARP@
    --unshare-all
    --share-net
    --die-with-parent
    --ro-bind /nix/store /nix/store
    --ro-bind /run/current-system/sw /run/current-system/sw
    --ro-bind /etc /etc
    --proc /proc
    --dev /dev
    --tmpfs /tmp
    --tmpfs /run/user/$(id -u)
)

for d in "''${ro_dirs[@]}"; do
    [[ -n "$d" ]] && cmd+=( --ro-bind "$d" "$d" )
done

for d in "''${write_dirs[@]}"; do
    cmd+=( --bind "$d" "$d" )
done

cmd+=( --tmpfs /home/$(whoami) )

cmd+=( @OLLAMA@ run "@MODEL@" "''${args[@]}" )

exec "''${cmd[@]}"