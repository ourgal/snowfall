args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      path = ./.;
      value = {
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
)
