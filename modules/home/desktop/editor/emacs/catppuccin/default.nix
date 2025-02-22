args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.catppuccin-theme ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
