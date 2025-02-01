args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule domains;
  value = {
    services.caddy = {
      enable = true;
      virtualHosts = {
        "http://${domains.ariang}".extraConfig = ''
          root    * ${pkgs.ariang}/share/ariang
          file_server
        '';
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
