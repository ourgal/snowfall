args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.ligature ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
