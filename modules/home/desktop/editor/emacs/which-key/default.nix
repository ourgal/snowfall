args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.which-key ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
