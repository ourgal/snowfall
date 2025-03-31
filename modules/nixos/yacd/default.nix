args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled domains;
  value = {
    services.caddy = enabled // {
      virtualHosts = {
        "http://${domains.yacd}".extraConfig = ''
          root    * ${pkgs.${namespace}.yacd}
          file_server
        '';
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
