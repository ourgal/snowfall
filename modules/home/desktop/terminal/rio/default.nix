args:
args.module (
  args
  // {
    path = ./.;
    progs.rio.settings = {
      window = {
        background-opacity = 0.5;
        blur = true;
      };
      fonts = {
        size = 20;
        family = "FiraCode Nerd Font";
        extras = [ { family = "Source Han Sans"; } ];
      };
    };
  }
)
