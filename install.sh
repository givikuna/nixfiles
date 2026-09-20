#!/usr/bin/env bash

set -e

echo "starting Installation"

echo "available storage drives:"
lsblk -d -n -o NAME,SIZE,MODEL | grep -v "loop"
echo "----------------------------------------------------"
read -p "enter the drive name to completely WIPE and install NixOS onto: " DISK_NAME

DISK="/dev/$DISK_NAME"

if [ ! -b "$DISK" ]; then
    echo "error: Device $DISK does not exist!"
    exit 1
fi

if [[ "$DISK" == *"nvme"* ]]; then
    PART_PREFIX="${DISK}p"
else
    PART_PREFIX="${DISK}"
fi

echo "WARNING: this will completely destroy all data on $DISK."
read -p "do you want to proceed? (y/N): " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
    echo "installation cancelled."
    exit 1
fi

echo "partitioning $DISK..."
parted "$DISK" -- mklabel gpt
parted "$DISK" -- mkpart ESP fat32 1MiB 512MiB
parted "$DISK" -- set 1 esp on # might have to change esp -> boot or vice versa
parted "$DISK" -- mkpart primary ext4 512MiB 100%

echo "formatting partitions..."
mkfs.vfat -F32 "${PART_PREFIX}1"
mkfs.ext4 -F -F "${PART_PREFIX}2"

echo ""

if [[ "$USE_LUKS" == "y" || "$USE_LUKS" == "Y" ]]; then
    echo "setting up LUKS encryption. you will be prompted to create a password."
    cryptsetup luksFormat "${PART_PREFIX}2"
    echo "please enter the password again to open the drive:"
    cryptsetup luksOpen "${PART_PREFIX}2" cryptroot
    echo "formatting encrypted partition..."
    mkfs.ext4 -F /dev/mapper/cryptroot
    echo "mounting filesystems..."
    mount /dev/mapper/cryptroot /mnt
else
    echo "formatting as plain ext4..."
    mkfs.ext4 -F -F "${PART_PREFIX}2"
    echo "mounting filesystems..."
    mount "${PART_PREFIX}2" /mnt
fi

mkdir -p /mnt/boot
mount "${PART_PREFIX}1" /mnt/boot

echo "fetching nixfiles..."
git clone https://github.com/givikuna/nixfiles.git /mnt/etc/nixos

cd /mnt/etc/nixos

echo ""
echo "who are you? (you must select one)"
echo "1) minotaur"
echo "2) nomad"
echo "3) pilgrim"
echo "4) colossus"
echo "5) hammond"
echo "6) orion"
read -p "Enter the number: " HOST_CHOICE

if [ "$HOST_CHOICE" == "1" ]; then
    HOSTNAME="minotaur"
elif [ "$HOST_CHOICE" == "2" ]; then
    HOSTNAME="nomad"
elif [ "$HOST_CHOICE" == "3" ]; then
    HOSTNAME="pilgrim"
elif [ "$HOST_CHOICE" == "4" ]; then
    HOSTNAME="colossus"
elif [ "$HOST_CHOICE" == "5" ]; then
    HOSTNAME="hammond"
elif [ "$HOST_CHOICE" == "6" ]; then
    HOSTNAME="orion"
else
    echo "invalid choice. cancelling installation.."
    exit 1
fi


echo "detecting laptop hardware..."
nixos-generate-config --root /mnt --dir /mnt/etc/nixos/hosts/$HOSTNAME

echo ""
echo "========================================="
echo "enter symmetric ynternals pass:"
read -rsp "paste or type the key here (or leave blank to skip):" YNTERNALS_KEY
echo ""

if [ -n "$YNTERNALS_KEY" ]; then
    echo "$YNTERNALS_KEY" > /mnt/etc/nixos/symmetric.key
    echo "key saved"
else
    echo "WARNING: no ynternals key has been provided."
    echo "         ynternals will fail on first boot."
fi


git add .

# sudo chmod +x scripts/*

echo "building and installing your system configuration..."
nixos-install --flake .#$HOSTNAME

echo ""
echo "set a password for your user account (givik):"
nixos-enter --root /mnt -c 'passwd givik'

nixos-enter --root /mnt -- chown -R givik:users /etc/nixos

echo "all done! you can now run: sudo reboot"
echo "once you reboot run:       post-install"
