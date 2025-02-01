args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      myPkgs = "hledger-fmt";
      nixPkgs = [
        # keep-sorted start
        "hledger"
        "puffin"
        # keep-sorted end
      ];
      tmpfiles = [ "d ${config.xdg.dataHome}/hledger - - - - -" ];
      env.LEDGER_FILE = "${config.xdg.dataHome}/hledger/main.journal";
    }
  )
)
