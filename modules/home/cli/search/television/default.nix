args:
args.module (
  args
  // (
    let
      inherit (args) toTOML;
    in
    {
      path = ./.;
      myPkgs = "television";
      confs."television/config.toml" = toTOML {
        ui = {
          use_nerd_font_icons = false;
          ui_scale = 90;
        };
      };
    }
  )
)
