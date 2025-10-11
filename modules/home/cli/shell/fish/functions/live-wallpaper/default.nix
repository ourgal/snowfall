args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs.fish.functions.live-wallpaper = {
        body = ''
          ${lib.getExe pkgs.xwinwrap} -ov -fs -- mpv --panscan=1.0 --no-input-default-bindings -loop -no-audio -no-osc -vo x11 -wid WID $argv[1]
        '';
        description = "live wallpaper";
      };
    }
  )
)
