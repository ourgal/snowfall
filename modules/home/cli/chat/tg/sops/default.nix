args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      value = {
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
)
