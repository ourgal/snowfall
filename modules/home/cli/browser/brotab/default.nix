args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      firefoxText = ''
        {
          "name": "brotab_mediator",
          "description": "This mediator exposes interface over TCP to control browser's tabs",
          "path": "${pkgs.brotab}/bin/bt_mediator",
          "type": "stdio",
          "allowed_extensions": [ "brotab_mediator@example.org" ]
        }
      '';
      chromiumNative = {
        name = "brotab_mediator";
        description = "This mediator exposes interface over TCP to control browser's tabs";
        path = "${pkgs.brotab}/bin/bt_mediator";
        type = "stdio";
        allowed_extensions = [ "brotab_mediator@example.org" ];
        allowed_origins = [ "chrome-extension://mhpeahbikehnfkfnmopaigggliclhmnc/" ];
      };
    in
    {
      nixPkgs = "brotab";
      confs = {
        "BraveSoftware/Brave-Browser/NativeMessagingHosts/brotab_mediator.json" = chromiumNative;
        "google-chrome/NativeMessagingHosts/brotab_mediator.json" = chromiumNative;
        "chromium/NativeMessagingHosts/brotab_mediator.json" = chromiumNative;
        "vivaldi/NativeMessagingHosts/brotab_mediator.json" = chromiumNative;
      };
      files = {
        ".mozilla/native-messaging-hosts/brotab_mediator.json" = firefoxText;
        ".librewolf/native-messaging-hosts/brotab_mediator.json" = firefoxText;
      };
    }
  )
)
