{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "openssl";
    progs = {
      ssh = {
        matchBlocks = {
          soft = {
            host = "soft";
            hostname = "brix.local";
            port = 23231;
          };
        };
      };
    };
  }
)
