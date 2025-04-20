args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      value.sops.secrets = {
        "jerry/token" = {
          mode = "0600";
          path = "${config.xdg.dataHome}/jerry/anilist_token.txt";
        };
        "jerry/id" = {
          mode = "0600";
          path = "${config.xdg.dataHome}/jerry/anilist_user_id.txt";
        };
      };
    }
  )
)
