{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "chafa";
    myPkgs = "jerry";
    value = with args; {
      sops = {
        secrets = {
          "jerry/token" = {
            mode = "0600";
            path = "${config.xdg.dataHome}/jerry/anilist_token.txt";
          };
          "jerry/id" = {
            mode = "0600";
            path = "${config.xdg.dataHome}/jerry/anilist_user_id.txt";
          };
        };
      };
    };
  }
)
