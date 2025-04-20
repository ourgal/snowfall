args:
args.module (
  args
  // (
    let
      inherit (args) lib;
    in
    {
      nixPkgs = [
        # keep-sorted start
        "rbw"
        "rofi-rbw"
        # keep-sorted end
      ];
      confs = {
        "rbw/config.json" = {
          email = lib.strings.fileContents ./email.key;
          sso_id = null;
          base_url = lib.strings.fileContents ./base_url.key;
          identity_url = null;
          ui_url = null;
          notifications_url = null;
          lock_timeout = 3600;
          sync_interval = 3600;
          pinentry = "pinentry";
          client_cert_path = null;
        };
      };
    }
  )
)
