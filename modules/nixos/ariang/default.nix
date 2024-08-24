{ ... }@args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace}) nixosModule;
  inherit (config.${namespace}.user) host;
  value = {
    services.caddy = lib.mkIf (host == "brix") {
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
