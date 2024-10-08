{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "rbw";
    confs = {
      "rbw/config.json" = builtins.toJSON {
        email = args.lib.strings.fileContents ./email.key;
        sso_id = null;
        base_url = args.lib.strings.fileContents ./base_url.key;
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
