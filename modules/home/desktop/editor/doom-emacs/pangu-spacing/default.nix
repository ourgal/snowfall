args:
args.module (
  args
  // {
    path = ./.;
    progs.doom-emacs.extraPackages = epkgs: [ epkgs.pangu-spacing ];
  }
)
