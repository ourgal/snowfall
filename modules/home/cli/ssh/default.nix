args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        namespace
        config
        host
        ;
      inherit (lib.${namespace}) mkSshConfig ip settings;
      inherit (builtins) elem;
    in
    {
      myPkgs = [
        # keep-sorted start
        "lssh"
        "shipit"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "fast-ssh"
        "ggh"
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
      tmpfiles = [ "d ${config.home.homeDirectory}/.ssh - - - - -" ];
      progs.ssh.matchBlocks = {
        github = {
          host = "github.com";
          hostname = "ssh.github.com";
          port = 443;
          user = "git";
        };
        termux = {
          host = "termux";
          hostname = "localhost";
          port = 8022;
          user = "u0_a420";
        };
      }
      // mkSshConfig
      // (
        if elem host settings.desktops && !elem host settings.work then
          {
            soft = {
              host = "soft";
              hostname = ip.brix;
              port = 23231;
            };
            m6 = {
              host = "m6";
              hostname = ip.m6;
              port = 2222;
              user = "u0_a420";
            };
            s10 = {
              host = "s10";
              hostname = ip.s10;
              port = 2222;
              user = "u0_a661";
            };
            u20 = {
              host = "u20";
              hostname = ip.u20;
              port = 2222;
              user = "u0_a519";
            };
          }
        else
          { }
      );
    }
  )
)
