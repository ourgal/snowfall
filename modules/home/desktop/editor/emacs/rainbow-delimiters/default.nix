args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.rainbow-delimiters ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
