args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        extraEntries = ''
          menuentry "Windows" {
              search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
              chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
