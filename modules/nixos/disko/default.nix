args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule;
  inherit (config.${namespace}.user) host;
  value = {
    disko.devices = {
      disk.disk1 = {
        device =
          if (host == "surface") then
            "/dev/nvme0n1"
          else if (host == "home") then
            "/dev/sda"
          else if (host == "air") then
            "/dev/nvme0n1"
          else if (host == "brix") then
            "/dev/sda"
          else
            builtins.throw "unknown host";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
              start = "1M";
              end = if (host == "surface") then "128M" else "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ]; # Override existing partition
                subvolumes = {
                  # Subvolume name is different from mountpoint
                  "root" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/";
                  };
                  # Subvolume name is the same as the mountpoint
                  "home" = {
                    mountOptions = [ "compress=zstd" ];
                    mountpoint = "/home";
                  };
                  # Parent is not mounted so the mountpoint must be set
                  "nix" = {
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                    mountpoint = "/nix";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
