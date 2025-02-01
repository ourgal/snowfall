args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    environment.etc = {
      "harmonia/secret".source = ./secret.key;
    };
    services.harmonia = enabled // {
      settings = {
        bind = "[::]:50000";
        workers = 4;
        max_connection_rate = 256;
        priority = 30;
      };
      signKeyPaths = [ "/etc/harmonia/secret" ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
