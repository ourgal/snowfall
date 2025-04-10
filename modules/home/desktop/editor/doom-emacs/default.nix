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
      };
      enable = [
        # keep-sorted start
        "alert"
        "annotate"
        "eglot-booster"
        "dotenv-mode"
        "git-time-metric"
        "magit-delta"
        "magit-stats"
        "magit-todos"
        "move-text"
        "nftables-mode"
        "nov"
        "pangu-spacing"
        "perltidy"
        "zoxide"
        # keep-sorted end
      ];
    }
  )
)
