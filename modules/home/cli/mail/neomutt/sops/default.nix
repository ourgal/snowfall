args:
args.module (
  args
  // {
    value = {
      sops = {
        secrets = {
          "neomutt/hotmail" = {
            mode = "0600";
            path = "${args.config.xdg.configHome}/neomutt/accounts/hotmail";
          };
        };
      };
    };
  }
)
