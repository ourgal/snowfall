{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "fast-ssh"
      "openssl"
      "sshpass"
      "sshs"
      "termscp"
      # keep-sorted end
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
