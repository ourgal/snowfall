args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  pasv_max_port = 10100;
  pasv_min_port = 10090;
  value = {
    services.vsftpd = enabled // {
      writeEnable = true;
      localUsers = true;
      chrootlocalUser = true;
      allowWriteableChroot = true;
      extraConfig = ''
        pasv_enable=Yes
        pasv_max_port=${toString pasv_max_port}
        pasv_min_port=${toString pasv_min_port}
      '';
    };
    networking.firewall = {
      allowedTCPPorts = [ 21 ];
      allowedTCPPortRanges = [
        {
          from = pasv_min_port;
          to = pasv_max_port;
        }
      ];
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
