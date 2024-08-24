{ ... }@args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  Port = 5000;
  value = {
    services.kavita = enabled // {
      tokenKeyFile = ./tokenKeyFile.key;
      settings = {
        inherit Port;
      };
    };
    services.caddy = enabled // {
      virtualHosts = {
        "http://kavita.zxc.cn".extraConfig = ''
          reverse_proxy http://localhost:${toString Port}
        '';
      };
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
