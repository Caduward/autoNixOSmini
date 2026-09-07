#!/bin/sh

# Criação de partição
parted /dev/sda --script mklabel gpt \
mkpart primary 1MiB 512MiB \
mkpart primary 512 MiB 100% \

# Formatação das partições
mkfs.ext4 /dev/sda2 \
mkfs.fat -F 32 /dev/sda1 \

# Montagem
mount /dev/sda2 /mnt \
mkdir /mnt/boot \
mount /dev/sda1 /mnt/boot \

# Gerando configuração básica
nixos-generate-config --root /mnt \
cd /etc/nixos/ \
ls
