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
    }
  )
)
