args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "bottles"
        "gnome-mahjongg"
        "moonlight-qt"
        "prismlauncher"
        "wine"
        "retroarch"
        "lutris"
        # keep-sorted end
      ];
      value = {
        systemd.user.tmpfiles.rules = [ "d ${config.home.homeDirectory}/Games - - - -" ];
      };
    }
  )
)
