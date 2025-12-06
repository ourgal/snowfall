args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      progs = "retroarch";
      nixPkgs = [
        # keep-sorted start
        "bottles"
        "gnome-mahjongg"
        "lutris"
        "moonlight-qt"
        "prismlauncher"
        "wine"
        # keep-sorted end
      ];
      value = {
        systemd.user.tmpfiles.rules = [ "d ${config.home.homeDirectory}/Games - - - -" ];
      };
    }
  )
)
