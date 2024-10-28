{ ... }: { disko.devices = {
  
    disk.main = {
      device = "/dev/nvme0n1";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            name = "boot";
            size = "1M";
            type = "EF02";
          };
          esp = {
            name = "ESP";
            size = "500M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
            };
          };
          swap = {
            size = "16G";
            content = {
              type = "swap";
              resumeDevice = true;
            };
          };
          root = {
            name = "root";
            size = "100%";
            content = {
              type = "lvm_pv";
              vg = "root_vg";
            };
          };
        };
      };
    };

    lvm_vg = {
      root_vg = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%FREE";
            content = {
              type = "btrfs";
              extraArgs = ["-f"];
              subvolumes = {
                "/root" = {
                  mountOptions = [ "compress=zstd:3" "noatime" ];
                  mountpoint = "/";
                };
                "/home" = {
                  mountOptions = [ "compress=zstd:3" "noatime" ];
                  mountpoint = "/home";  
                };
                "/nix" = {
                  mountOptions = [ "subvol=nix" "compress=zstd:3" "noatime" ];
                  mountpoint = "/nix";
                };
                "/persist" = {
                  mountOptions = [ "subvol=persist" "compress=zstd:3" "noatime" ];
                  mountpoint = "/persist";
                };
              };
            };
          };
        };
      };
    };
  };

}
