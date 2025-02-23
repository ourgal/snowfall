args:
args.module (
  args
  // {
    path = ./.;
    progs.doom-emacs.extraPackages = epkgs: [
      (epkgs.melpaBuild { inherit (args.pkgs._sources.emacs-git-time-metric) pname version src; })
    ];
  }
)
