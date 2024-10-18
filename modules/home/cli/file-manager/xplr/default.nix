args:
args.module (
  args
  // {
    path = ./.;
    progs = [
      "xplr"
      {
        fish.functions.xcd = {
          body = ''cd "(xplr --print-pwd-as-result)"'';
          description = "xplr cd on quit";
        };
      }
    ];
  }
)
