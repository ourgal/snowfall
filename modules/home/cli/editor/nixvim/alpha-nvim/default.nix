args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          alpha = {
            enable = true;
            theme = "dashboard";
            iconsEnabled = true;
          };
        };
      };
    };
  }
)
