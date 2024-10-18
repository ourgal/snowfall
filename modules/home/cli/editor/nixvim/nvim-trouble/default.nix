args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          trouble.enable = true;
        };
      };
    };
  }
)
