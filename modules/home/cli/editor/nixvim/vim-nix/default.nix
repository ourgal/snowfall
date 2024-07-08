{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nixvim = {
        plugins = {
          nix.enable = true;
        };
      };
    };
  }
)
