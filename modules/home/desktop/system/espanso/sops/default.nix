args:
args.module (
  args
  // (
    let
      inherit (args) config;
    in
    {
      value.sops.secrets."espanso/mail.yml" = {
        mode = "0600";
        path = "${config.xdg.configHome}/espanso/match/mail.yml";
      };
    }
  )
)
