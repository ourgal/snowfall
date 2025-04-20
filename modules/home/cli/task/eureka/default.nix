args:
args.module (
  args
  // (
    let
      inherit (args) config namespace;
    in
    {
      nixPkgs = "eureka-ideas";
      confs = {
        "eureka/config.json" = # json
          ''
            {"repo":"${config.xdg.dataHome}/eureka/ideas"}
          '';
      };
      progs.fish.shellAbbrs.ideas = "eureka";
      value = {
        ${namespace}.cli.utils.alias.aliae.alias = {
          ideas = "eureka";
        };
      };
    }
  )
)
