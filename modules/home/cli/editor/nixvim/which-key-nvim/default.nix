args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          which-key.enable = true;
        };
      };
    };
  }
)
