args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  PRIMARYUSBID = "4824-9361";
  value = {
    # Kernel modules needed for mounting USB VFAT devices in initrd stage
    boot.initrd.kernelModules = [
      "uas"
      "usbcore"
      "usb_storage"
      "vfat"
      "nls_cp437"
      "nls_iso8859_1"
    ];

    boot.initrd.systemd = enabled // {
      contents."/etc/fstab".text = ''
        UUID=${PRIMARYUSBID} /key vfat ro
      '';
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
