{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          markdown-preview = {
            enable = true;
            settings.theme = "dark";
          };
        };
      };
    };
  }
)
