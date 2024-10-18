args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services = {
      atuin = enabled // {
        openFirewall = true;
        openRegistration = true;
        host = "0.0.0.0";
      };
      postgresql = enabled;
      caddy = enabled // {
        virtualHosts = {
          "http://atuin.zxc.cn".extraConfig = ''
            reverse_proxy http://localhost:8888
          '';
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
