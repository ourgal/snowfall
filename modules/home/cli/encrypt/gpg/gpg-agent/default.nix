args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        switch
        config
        cfgHome
        namespace
        lib
        ;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      servs.gpg-agent = {
        enableSshSupport = cfg.ssh.enable;
        enableFishIntegration = true;
        sshKeys = lib.optional cfg.ssh.enable "C92C2BCD646A0DE6A60E1C5397CA97FDBE330909";
        pinentry = {
          program = "pinentry-qt";
          package = pkgs.pinentry-qt;
        };
      };
      extraOpts = {
        ssh = switch;
      };
    }
  )
)
