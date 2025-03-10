args:
args.module (
  args
  // (
    let
      inherit (args) enabled pkgs;
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
        emacs = pkgs.emacs29;
      };
      enable = [
        # keep-sorted start
        "eglot-booster"
        "git-time-metric"
        "magit-delta"
        "magit-stats"
        "magit-todos"
        "move-text"
        "nov"
        "pangu-spacing"
        "perltidy"
        "zoxide"
        # keep-sorted end
      ];
    }
  )
)
