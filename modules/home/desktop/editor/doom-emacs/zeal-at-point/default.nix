args:
args.module (
  args
  // {
    progs.doom-emacs.extraPackages = epkgs: [
      (epkgs.melpaBuild { inherit (args.pkgs._sources.emacs-zeal-at-point) pname version src; })
    ];
  }
)
