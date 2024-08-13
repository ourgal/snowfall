{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "aichat";
    value = with args; {
      sops = {
        secrets = {
          "aichat" = {
            mode = "0600";
            path = "${config.xdg.configHome}/aichat/config.yaml";
          };
        };
      };
    };
  }
)
