{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "lssh"
      "shipit"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "fast-ssh"
      "openssl"
      "ssh-tools"
      "sshpass"
      "sshs"
      "sshx"
      "termscp"
      "wishlist"
      # keep-sorted end
    ];
    enable = "ssh-tpm-agent";
    progs = {
      ssh =
        let
          inherit (args.lib.${args.namespace}) mkSshConfig;
        in
        {
          matchBlocks = {
            soft = {
              host = "soft";
              hostname = "brix.local";
              port = 23231;
            };
          } // mkSshConfig;
        };
    };
  }
)
