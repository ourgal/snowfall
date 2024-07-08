{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          comment = {
            enable = true;
            settings.sticky = true;
          };
        };
      };
    };
  }
)
