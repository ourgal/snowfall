args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule domains;
  value = {
    services.caddy = {
      enable = true;
      virtualHosts = {
        "http://${domains.cyberchef}".extraConfig = ''
          root    * ${pkgs.cyberchef}/share/cyberchef
          file_server
        '';
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
