{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "geminicommit";
    value = with args; {
      sops = {
        secrets = {
          "geminicommit" = {
            mode = "0600";
            path = "${config.xdg.configHome}/geminicommit/config.toml";
          };
        };
      };
    };
  }
)
