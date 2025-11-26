args:
args.module (
  args
  // (
    let
      inherit (args) lib;
    in
    {
      progs.rio.settings = {
        window = {
          background-opacity = 0.5;
          blur = true;
        };
        fonts = {
          size = lib.mkDefault 20;
          family = lib.mkDefault "monospace";
          extras = [ { family = "Source Han Sans"; } ];
        };
      };
    }
  )
)
