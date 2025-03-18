args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  port = 21;
  pasv_max_port = 10100;
  pasv_min_port = 10090;
  value = {
    services.vsftpd = enabled // {
      writeEnable = true;
      localUsers = true;
      chrootlocalUser = true;
      allowWriteableChroot = true;
      anonymousUser = true;
      anonymousUserHome = "/home/${user}";
      anonymousUserNoPassword = true;
      extraConfig = ''
        pasv_enable=Yes
        pasv_max_port=${toString pasv_max_port}
        pasv_min_port=${toString pasv_min_port}
      '';
    };
    networking.firewall = {
      allowedTCPPorts = [ port ];
      allowedTCPPortRanges = [
        {
          from = pasv_min_port;
          to = pasv_max_port;
        }
      ];
    };
    ${namespace}.user.ports = [ port ] ++ lib.lists.range pasv_min_port pasv_max_port;
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
