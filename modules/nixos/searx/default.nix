args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  port = 8080;
  value = {
    services = {
      searx = enabled // {
        settings = {
          server = {
            inherit port;
            bind_address = "0.0.0.0";
            secret_key = lib.strings.fileContents ./secret_key.key;
          };
        };
      };
      caddy = enabled // {
        virtualHosts = {
          "http://searx.zxc.cn".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
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
