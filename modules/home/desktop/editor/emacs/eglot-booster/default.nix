args:
args.module (
  args
  // {
    progs.emacs = {
      extraPackages = epkgs: [
        (epkgs.melpaBuild { inherit (args.pkgs._sources.emacs-eglot-booster) pname version src; })
      ];
      extraConfig = builtins.readFile ./config.el;
    };
  }
)
