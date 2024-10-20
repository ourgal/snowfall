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
      nixPkgs = "hledger";
      dataFiles."hledger/.keep" = "";
      env.LEDGER_FILE = "${config.xdg.dataHome}/hledger/main.journal";
    }
  )
)
