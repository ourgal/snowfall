args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule switch cfgNixos;
  inherit (config.${namespace}.user) host;
  inherit (builtins) elem throw;
  cfg = cfgNixos config.${namespace} ./.;
  gpt = {
    type = "gpt";
    partitions = {
      ESP = {
        priority = 1;
        name = "ESP";
        start = "1M";
        end = "512M";
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
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
              mountpoint = "/";
            };
            # Subvolume name is the same as the mountpoint
            "home" = {
              mountOptions = [
                "compress=zstd"
                "noatime"
              ];
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
  msdos = {
    type = "table";
    format = "msdos";
    partitions = [
      {
        name = "root";
        part-type = "primary";
        start = "1M";
        end = "100%";
        bootable = true;
        content = {
          type = "filesystem";
          format = "ext4";
          mountpoint = "/";
        };
      }
    ];
  };
  luks-btrfs = {
    type = "gpt";
    partitions = {
      ESP = {
        size = "512M";
        type = "EF00";
        content = {
          type = "filesystem";
          format = "vfat";
          mountpoint = "/boot";
          mountOptions = [ "umask=0077" ];
        };
      };
      luks = {
        size = "100%";
        content = {
          type = "luks";
          name = "crypted";
          # disable settings.keyFile if you want to use interactive password entry
          #passwordFile = "/tmp/secret.key"; # Interactive
          settings = {
            allowDiscards = true;
            keyFile = "/key/keyfile";
          };
          # additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            subvolumes = {
              "root" = {
                mountpoint = "/";
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                ];
              };
              "home" = {
                mountpoint = "/home";
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                ];
              };
              "nix" = {
                mountpoint = "/nix";
                mountOptions = [
                  "compress=zstd"
                  "noatime"
                ];
              };
              "swap" = {
                mountpoint = "/.swapvol";
                swap.swapfile.size = "4G";
              };
            };
          };
        };
      };
    };
  };
  value = {
    disko.devices = {
      disk = {
        disk1 = {
          device =
            if
              elem host [
                "air"
                "surface"
                "nixos-uefi"
                "office1"
              ]
            then
              "/dev/nvme0n1"
            else if
              elem host [
                "brix"
                "home"
                "router"
                "yanyu"
                "nixos-mbr"
              ]
            then
              "/dev/sda"
            else
              throw "unknown host";
          type = "disk";
          content =
            if
              elem host [
                "nixos-mbr"
                "router"
              ]
            then
              msdos
            else if cfg.encrypt.enable then
              luks-btrfs
            else
              gpt;
        };
      };
    };
  };
  extraOpts = {
    encrypt = switch;
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
