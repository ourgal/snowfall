{ ... }@args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    services.caddy = {
      enable = true;
      virtualHosts = {
        "http://ariang.zxc.cn".extraConfig = ''
          root    * ${pkgs.ariang}/share/ariang
          file_server
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
