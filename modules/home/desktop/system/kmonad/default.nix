{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        host
        lib
        namespace
        pkgs
        ;
    in
    {
      path = ./.;
      nixPkgs = "kmonad";
      value = {
        systemd.user.services."kmonad@miryoku" =
          lib.mkIf (builtins.elem host lib.${namespace}.settings.laptops)
            {
              Unit = {
                Description = "Kmonad keyboard config";
              };
              Install = {
                WantedBy = [ "default.target" ];
              };
              Service = {
                ExecStart = "${pkgs.kmonad}/bin/kmonad %E/kmonad/%i.kbd";
                Nice = -20;
              };
            };
        xdg.configFile = {
          "kmonad/miryoku.kbd".source =
            if host == "surface" then
              ./miryoku_surface.kbd
            else if host == "air" then
              ./miryoku_air.kbd
            else if host == "home" then
              ./miryoku_niz.kbd
            else
              builtins.throw "unknow host";
        };
      };
    }
  )
)
