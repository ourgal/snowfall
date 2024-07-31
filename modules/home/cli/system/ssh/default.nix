{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "openssl"
      "sshpass"
      "sshs"
      "termscp"
    ];
    enable = "ssh-tpm-agent";
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
