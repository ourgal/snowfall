args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) mkSshConfig;
    in
    {
      path = ./.;
      myPkgs = [
        # keep-sorted start
        "lssh"
        "shipit"
        "trzsz-ssh"
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
      progs.ssh.matchBlocks = {
        soft = {
          host = "soft";
          hostname = "brix.local";
          port = 23231;
        };
      } // mkSshConfig;
    }
  )
)
