{pkgs}: pkgs.writeShellScriptBin "install" ''

  #!/usr/bin/env bash

  # wipe drive
  sudo sgdisk -Z /dev/nvme0n1

  # fetch files
  sudo nix --experimental-features "nix-command flakes" run nixpkgs#git -- clone https://github.com/hatosu/config /tmp/config

  # format disk
  sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/config/profile/temporary/disk.nix --arg device '"/dev/nvme0n1"'

  # generate config
  sudo nixos-generate-config --no-filesystems --root /mnt

  # alter & move files
  sudo rm -f /tmp/config/flake.lock
  sudo rm -f /mnt/etc/nixos/configuration.nix
  sudo cp -rf /tmp/config/* /mnt/etc/nixos
  sudo mv -f /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/profile/temporary/hardware.nix

  # install nixos
  sudo nixos-install --root /mnt --flake /mnt/etc/nixos#temporary

''
