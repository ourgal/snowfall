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
        family = "Maple Mono SC NF";
        extras = [ { family = "Source Han Sans"; } ];
      };
    };
  }
)
