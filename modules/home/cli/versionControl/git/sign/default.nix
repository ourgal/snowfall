args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      progs.git = {
        signing = {
          key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
          signByDefault = true;
        };
        extraConfig.gpg.format = "ssh";
      };
    }
  )
)
