args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs = {
      extraPackages = epkgs: [ epkgs.melpaPackages.telega ];
    };
  }
)
