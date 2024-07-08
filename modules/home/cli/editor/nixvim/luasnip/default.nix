{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          luasnip.enable = true;
        };
      };
    };
  }
)
