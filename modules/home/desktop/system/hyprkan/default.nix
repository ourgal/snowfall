args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib namespace;
    in
    {
      confs."kanata/apps.json" = [
        {
          class = "firefox";
          layer = "firefox_layer";
        }
        {
          class = "*";
          title = "*";
          layer = "base";
        }
      ];
      systemdServices.hyprkan = {
        online = true;
        gui = true;
        start = "${lib.getExe pkgs.${namespace}.hyprkan} -p 16666";
      };
    }
  )
)
