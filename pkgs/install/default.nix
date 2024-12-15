{pkgs}: pkgs.writeShellScriptBin "install" ''

  #!/usr/bin/env bash

  # wipe drive
  sgdisk -Z /dev/nvme0n1

  # fetch files
  nix --experimental-features "nix-command flakes" run nixpkgs#git -- clone https://github.com/hatosu/config /tmp/config

  # format disk
  nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/config/profile/temporary/disk.nix --arg device '"/dev/nvme0n1"'

  # generate config
  nixos-generate-config --no-filesystems --root /mnt

  # alter & move files
  rm -f /tmp/config/flake.lock
  rm -f /mnt/etc/nixos/configuration.nix
  cp -rf /tmp/config/* /mnt/etc/nixos
  mv -f /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/profile/temporary/hardware.nix

  # backup
  mkdir /persist
  cp -rf /mnt/etc/nixos /persist

  # install nixos
  nixos-install --root /mnt --flake /mnt/etc/nixos#temporary

''
