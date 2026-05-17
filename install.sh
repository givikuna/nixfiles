#!/usr/bin/env bash

set -e

echo "Starting Installation"

echo "Available storage drives:"
lsblk -d -n -o NAME,SIZE,MODEL | grep -v "loop"
echo "----------------------------------------------------"
read -p "Enter the drive name to completely WIPE and install NixOS onto: " DISK_NAME

DISK="/dev/$DISK_NAME"

if [ ! -b "$DISK" ]; then
    echo "Error: Device $DISK does not exist!"
    exit 1
fi

if [[ "$DISK" == *"nvme"* ]]; then
    PART_PREFIX="${DISK}p"
else
    PART_PREFIX="${DISK}"
fi

echo "WARNING: This will completely destroy all data on $DISK."
read -p "Do you want to proceed? (y/N): " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "Installation cancelled."
    exit 1
fi

echo "Set a password for your user account (givik):"
nixos-enter --root /mnt -c 'passwd givik'

echo "Partitioning $DISK..."
parted "$DISK" -- mklabel gpt
parted "$DISK" -- mkpart ESP fat32 1MiB 512MiB
parted "$DISK" -- set 1 esp on # might have to change esp -> boot or vice versa
parted "$DISK" -- mkpart primary ext4 512MiB 100%

echo "Formatting partitions..."
mkfs.vfat -F32 "${PART_PREFIX}1"
mkfs.ext4 -F -F "${PART_PREFIX}2"

echo "Mounting filesystems..."
mount "${PART_PREFIX}2" /mnt
mkdir -p /mnt/boot
mount "${PART_PREFIX}1" /mnt/boot

echo "Fetching dotfiles..."
git clone https://github.com/givikuna/nixfiles.git /mnt/etc/nixos

cd /mnt/etc/nixos

echo "Detecting laptop hardware..."
nixos-generate-config --root /mnt --dir /mnt/etc/nixos/hosts/nixos

git add hosts/nixos/hardware-configuration.nix

# sudo chmod +x scripts/*

echo "Building and installing your system configuration..."
nixos-install --flake .#nixos

nixos-enter --root /mnt -- chown -R givik:users /etc/nixos

echo "All done! You can now run: sudo reboot"
