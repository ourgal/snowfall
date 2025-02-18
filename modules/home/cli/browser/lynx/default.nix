args:
args.module (
  args
  // (
    let
      inherit (args) config;
      configPath = "${config.xdg.configHome}/lynx/config";
    in
    {
      path = ./.;
      nixPkgs = "lynx";
      confs.lynx = ./config;
      env.LYNX_CFG = configPath;
    }
  )
)
