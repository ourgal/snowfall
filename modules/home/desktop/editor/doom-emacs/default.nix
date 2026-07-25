args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) domains;
    in
    {
      servs = {
        emacs = {
          startWithUserSession = "graphical";
        };
      };
      nixPkgs = [
        # keep-sorted start
        "emacs-lsp-booster"
        "gnuplot"
        "parinfer-rust-emacs"
        # keep-sorted end
      ];
      confs = {
        "doom/.authinfo" =
          "machine ${domains.miniflux} port 80 login miniflux password ${lib.strings.fileContents ./miniflux.key}";
      };
      progs.doom-emacs = {
        enable = true;
        doomDir = ./config;
        experimentalFetchTree = true; # Disable if there are fetcher issues
      };
    }
  )
)
