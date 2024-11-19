{ pkgs, lib, inputs, ... }: {

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/root_vg/root /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi
    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/btrfs_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }
    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
        delete_subvolume_recursively "$i"
    done
    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

  programs.fuse.userAllowOther = true;
  fileSystems."/persist".neededForBoot = true;
  environment.persistence."/persist/system" = { hideMounts = true;

    # root
    directories = [
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/docker"
      "/var/lib/waydroid"
      "/var/lib/systemd/coredump"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];
    files = [
      { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
    
    # home
    users.hatosu = {
      directories = [ ".cache/dconf" ".config/dconf"
        "X"
        ".mozilla"
        ".config/godot"
        ".config/vesktop"
        ".config/spotify"
        ".config/Ryujinx"
        ".config/Cemu"
        ".local/share/kdenlive"
        ".local/share/Steam"
        ".local/share/waydroid"
        ".local/share/DaVinciResolve"
        ".local/share/shadPS4"
        ".local/share/Cemu"
      ];
      files = [
        ".zsh_history"
        ".config/kdenliverc"
        ".config/kdenlive-layoutsrc"
      ];
    };

  };

  # declare machine-id (prevents impermanence errors)
  environment.etc.machine-id = { text = "a18b549c5915442693cd012bb398da2f"; enable = true; };

  # set correct home permissions
  systemd.tmpfiles.settings = {

    "persist-hatosu-homedir" = {
      "/persist/home/hatosu" = {
        d = {
          group = "users";
          user = "hatosu";
          mode = "0774";
        };
      };
    };
  
    "hatosu-homedir" = {
      "/home/hatosu" = {
        d = {
          group = "users";
          user = "hatosu";
          mode = "0774";
        };
      };
    };

  };

}
