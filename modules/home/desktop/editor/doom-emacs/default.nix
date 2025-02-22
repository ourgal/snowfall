args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      servs = "emacs";
      nixPkgs = [
        # keep-sorted start
        "emacs-lsp-booster"
        "gnuplot"
        # keep-sorted end
      ];
      progs.doom-emacs = enabled // {
        doomDir = ./config;
        experimentalFetchTree = true; # Disable if there are fetcher issues
        extraPackages =
          epkgs:
          let
            build =
              p: builtins.map (x: epkgs.melpaBuild { inherit (args.pkgs._sources.${x}) pname version src; }) p;
          in
          build [
            # keep-sorted start
            "emacs-eglot-booster"
            "emacs-git-time-metric"
            "emacs-perltidy"
            "emacs-zoxide"
            # keep-sorted end
          ];
      };
    }
  )
)
