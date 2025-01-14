args:
args.module (
  args
  // {
    path = ./.;
    progs.fzf = {
      defaultOptions = [ "--height 40%" ];
    };
    value.catppuccin.fzf.enable = false;
  }
)
