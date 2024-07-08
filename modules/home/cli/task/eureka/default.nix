{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "eureka-ideas";
    confs = with args; {
      "eureka/config.json" = # json
        ''
          {"repo":"${config.xdg.dataHome}/eureka/ideas"}
        '';
    };
    progs = {
      fish = {
        shellAbbrs = {
          ideas = "eureka";
        };
      };
    };
  }
)
