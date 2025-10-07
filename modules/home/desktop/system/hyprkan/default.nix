args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib namespace;
    in
    {
      confs."kanata/apps.json" = builtins.toJSON [
        {
          class = "calibre";
          title = "^calibre — ||";
          layer = "calibre_layer";
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
