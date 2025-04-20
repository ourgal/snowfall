args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      nixPkgs = [
        # keep-sorted start
        "bottles"
        "gamehub"
        "gnome-mahjongg"
        "lutris"
        "moonlight-qt"
        "prismlauncher"
        "retroarch"
        "wine"
        # keep-sorted end
      ];
      value = {
        systemd.user.tmpfiles.rules = [ "d ${config.home.homeDirectory}/Games - - - -" ];
      };
    }
  )
)
