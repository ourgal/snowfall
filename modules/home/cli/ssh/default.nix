args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace config;
      inherit (lib.${namespace}) mkSshConfig ip;
    in
    {
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
      perlPkgs = "AppClusterSSH";
      enable = "ssh-tpm-agent";
      tmpfiles = [ "d ${config.home.homeDirectory}/.ssh - - - - -" ];
      progs.ssh.matchBlocks = {
        soft = {
          host = "soft";
          hostname = ip.brix;
          port = 23231;
        };
      } // mkSshConfig;
    }
  )
)
