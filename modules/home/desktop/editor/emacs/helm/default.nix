args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.helm ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
