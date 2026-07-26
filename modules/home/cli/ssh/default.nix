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
        "opener"
        "openssl"
        "ssh-tools"
        "sshpass"
        "sshs"
        "sshx"
        "termscp"
        "trzsz-ssh"
        "wishlist"
        # keep-sorted end
      ];
      perlPkgs = "AppClusterSSH";
      tmpfiles = [ "d ${config.home.homeDirectory}/.ssh - - - - -" ];
      progs.ssh = {
        enableDefaultConfig = false;
        settings = {
          "*" = {
            ForwardAgent = false;
            addKeysToAgent = "no";
            compression = false;
            serverAliveInterval = 0;
            serverAliveCountMax = 3;
            hashKnownHosts = false;
            userKnownHostsFile = "~/.ssh/known_hosts";
            controlMaster = "no";
            controlPath = "~/.ssh/master-%r@%n:%p";
            controlPersist = "no";
          };
          "github.com" = {
            HostName = "ssh.github.com";
            Port = 443;
            User = "git";
          };
          termux = {
            HostName = "localhost";
            Port = 8022;
            User = "u0_a420";
          };
        }
        // mkSshConfig
        // (
          if elem host settings.desktops && !elem host settings.work then
            {
              soft = {
                HostName = ip.brix;
                Port = 23231;
              };
              m6 = {
                HostName = ip.m6;
                Port = 2222;
                User = "u0_a420";
              };
              s10 = {
                HostName = ip.s10;
                Port = 2222;
                User = "u0_a661";
              };
              u20 = {
                HostName = ip.u20;
                Port = 2222;
                User = "u0_a519";
              };
            }
          else
            { }
        );
      };
    }
  )
)
