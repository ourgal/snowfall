args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.dirvish ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
