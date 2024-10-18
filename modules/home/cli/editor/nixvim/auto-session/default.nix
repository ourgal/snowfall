args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          auto-session = {
            enable = true;
          };
        };
      };
    };
  }
)
