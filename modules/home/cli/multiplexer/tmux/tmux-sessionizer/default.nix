args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      nixPkgs = "tmux-sessionizer";
      confs."tms/config.toml" = {
        search_dirs = [
          {
            path = "${config.home.homeDirectory}/workspace";
            depth = 2;
          }
        ];
      };
    }
  )
)
