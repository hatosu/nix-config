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
      "/var/lib/systemd/coredump"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];
    files = [
      { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
    
    # home
    users.hatosu = {
      directories = [
        "X"
        ".horror"
        ".mozilla"
        ".cache/dconf"
        ".config/dconf"
        ".config/vesktop"
        ".config/spotify"
        ".local/share/Steam"
        ".local/share/anime-game-launcher"
      ];
      files = [
        ".zsh_history"
      ];
    };

  };

  systemd.tmpfiles.settings = {
    "persist-hatosu-homedir" = {
      "/persist/home/hatosu" = {
        d = {
          group = "users";
          user = "hatosu";
          mode = "0700";
        };
      };
    };
  };

  system.activationScripts.spotify.text = ''
    DIR="$HOME/.config/spotify"
    if [ -d "$DIR" ]; then
      chmod -R 777 "$DIR"
    fi
  '';

}
