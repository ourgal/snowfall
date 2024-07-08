{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "kmonad";
    value = with args; {
      systemd.user.services."kmonad@miryoku" = lib.mkIf (host == "surface") {
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
          else if host == "home" then
            ./miryoku_niz.kbd
          else
            builtins.throw "unknow host";
      };
    };
  }
)
