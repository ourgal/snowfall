args:
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
      systemdServices."kmonad@miryoku" =
        if (builtins.elem host lib.${namespace}.settings.laptops) then
          {
            start = "${pkgs.kmonad}/bin/kmonad %E/kmonad/%i.kbd";
            nice = -20;
          }
        else
          { };
      value = {
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
