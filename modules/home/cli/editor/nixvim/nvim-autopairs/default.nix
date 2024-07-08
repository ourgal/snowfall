{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          nvim-autopairs.enable = true;
        };
      };
    };
  }
)
