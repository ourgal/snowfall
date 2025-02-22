args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.apheleia ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
