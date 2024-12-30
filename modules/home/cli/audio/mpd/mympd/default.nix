args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
      user = config.${namespace}.user.name;
      confPath = "${config.xdg.configHome}/mympd";
      cachePath = "${config.xdg.cacheHome}/mympd";
      port = 8002;
    in
    {
      path = ./.;
      confs = {
        "mympd/config/ssl" = "false";
        "mympd/config/http_port" = toString port;
      };
      systemdServices.mympd = {
        Unit = {
          Requires = "dbus.socket";
          After = "mpd.service";
        };
        restart = "always";
        start = "${pkgs.mympd}/bin/mympd --user ${user} --workdir ${confPath} --cachedir ${cachePath}";
      };
    }
  )
)
