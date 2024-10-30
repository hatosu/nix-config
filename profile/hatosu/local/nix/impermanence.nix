{ config, lib, ... }: {

    programs.fuse.userAllowOther = true;
    boot.initrd.systemd.services.rollback = {
      description = "rollback btrfs root subvolume";
      wantedBy = ["initrd.target"];
      after = ["systemd-cryptsetup@enc.service"];
      before = ["sysroot.mount"];
      unitConfig.DefaultDependencies = "no";
      serviceConfig.Type = "oneshot";
      script = ''
        mkdir -p /mnt
        mount -o subvol=/ /dev/mapper/enc /mnt
        btrfs subvolume list -o /mnt/root
        btrfs subvolume list -o /mnt/root |
        cut -f9 -d' ' |
        while read subvolume; do
          echo "deleting /$subvolume subvolume..."
        done &&
        echo "deleting /root subvolume..." &&
        echo "restoring blank /root subvolume..."
        umount /mnt
      '';
    };

    environment.persistence."/persist" = {
      hideMounts = true;
      directories = [
        "/etc/nixos"
        "/etc/NetworkManager/system-connections"
        "/var/log"
        "/var/lib/bluetooth"
        "/var/lib/nixos"
        "/var/lib/systemd/coredump"
      ];
      files = [
        "/etc/machine-id"
      ];
    };

}
