{ ... }@args:
args.module (
  args
  // {
    path = ./.;
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
