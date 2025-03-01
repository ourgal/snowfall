args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    services.udev = {
      packages = [
        pkgs.android-udev-rules
        pkgs.${namespace}.nrf-udev
      ];
      extraRules = ''
        SUBSYSTEM=="usb", ATTR{idVendor}=="12d1", ATTR{idProduct}=="107e", MODE="0666", GROUP="plugdev"

        # GnuPG/pcsclite
        # SUBSYSTEM!="usb", GOTO="canokeys_rules_end"
        # ACTION!="add|change", GOTO="canokeys_rules_end"
        # ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="42d4", ENV{ID_SMARTCARD_READER}="1"
        # LABEL="canokeys_rules_end"

        # FIDO2/U2F
        # note that if you find this line in 70-u2f.rules, you can ignore it
        # KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="20a0", ATTRS{idProduct}=="42d4", TAG+="uaccess", GROUP="plugdev", MODE="0660"

        # make this usb device accessible for users, used in WebUSB
        # change the mode so unprivileged users can access it, insecure rule, though
        # SUBSYSTEMS=="usb", ATTR{idVendor}=="20a0", ATTR{idProduct}=="42d4", MODE:="0666"

        # if the above works for WebUSB (web console), you may change into a more secure way
        # choose one of the following rules
        # note if you use "plugdev", make sure you have this group and the wanted user is in that group
        SUBSYSTEMS=="usb", ATTR{idVendor}=="20a0", ATTR{idProduct}=="42d4", GROUP="plugdev", MODE="0660"
        # SUBSYSTEMS=="usb", ATTR{idVendor}=="20a0", ATTR{idProduct}=="42d4", TAG+="uaccess"

        # kindle
        SUBSYSTEM=="usb", ATTR{idVendor}=="1949", ATTR{idProduct}=="0251", MODE="0666", GROUP="plugdev"

        # iReader
        SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e41", MODE="0666", GROUP="plugdev"
      '';
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
