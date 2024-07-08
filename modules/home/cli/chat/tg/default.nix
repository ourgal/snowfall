{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "tg";
    value = with args; {
      sops = {
        secrets = {
          "tg" = {
            mode = "0600";
            path = "${config.xdg.configHome}/tg/conf.py";
          };
        };
      };
    };
  }
)
