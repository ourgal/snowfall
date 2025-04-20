args:
args.module (
  args
  // {
    progs.doom-emacs.extraPackages = epkgs: [
      (epkgs.melpaBuild { inherit (args.pkgs._sources.emacs-perltidy) pname version src; })
    ];
  }
)
