{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          gitsigns = {
            enable = true;
            settings.current_line_blame = false;
          };
        };
      };
    };
  }
)
