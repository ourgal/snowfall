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
        path = "/nix/store/m607xc81cjqzjlmdq21pkna3lzbgssvm-brotab-1.4.2/bin/bt_mediator";
        type = "stdio";
        allowed_extensions = [ "brotab_mediator@example.org" ];
        allowed_origins = [ "chrome-extension://mhpeahbikehnfkfnmopaigggliclhmnc/" ];
      };
    in
    {
      path = ./.;
      nixPkgs = "brotab";
      confs = {
        "BraveSoftware/Brave-Browser/NativeMessagingHosts/brotab_mediator.json" = builtins.toJSON chromiumNative;
        "google-chrome/NativeMessagingHosts/brotab_mediator.json" = builtins.toJSON chromiumNative;
        "chromium/NativeMessagingHosts/brotab_mediator.json" = builtins.toJSON chromiumNative;
        "vivaldi/NativeMessagingHosts/brotab_mediator.json" = builtins.toJSON chromiumNative;
      };
      files = {
        ".mozilla/native-messaging-hosts/brotab_mediator.json" = firefoxText;
        ".librewolf/native-messaging-hosts/brotab_mediator.json" = firefoxText;
      };
    }
  )
)
