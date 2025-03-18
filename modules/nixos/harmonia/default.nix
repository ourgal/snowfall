args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  port = 50000;
  value = {
    environment.etc = {
      "harmonia/secret".source = ./secret.key;
    };
    services.harmonia = enabled // {
      settings = {
        bind = "[::]:${toString port}";
        workers = 4;
        max_connection_rate = 256;
        priority = 30;
      };
      signKeyPaths = [ "/etc/harmonia/secret" ];
    };
    ${namespace}.user.ports = [ port ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
