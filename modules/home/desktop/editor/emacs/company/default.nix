args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.company ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
