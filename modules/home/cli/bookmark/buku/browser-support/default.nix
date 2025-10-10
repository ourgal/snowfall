args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
      base = {
        name = "com.samhh.bukubrow";
        description = "Bukubrow is a WebExtension for Buku, a command-line bookmark manager. This is the corresponding host that facilitates interfacing with the Buku database via native messaging.";
        path = lib.getExe pkgs.bukubrow;
        type = "stdio";
      };
      chromiumNative = base // {
        allowed_origins = [ "chrome-extension://ghniladkapjacfajiooekgkfopkjblpn/" ];
      };
      firefoxNative = base // {
        allowed_extensions = [ "bukubrow@samhh.com" ];
      };
    in
    {
      confs = {
        "BraveSoftware/Brave-Browser/NativeMessagingHosts/com.samhh.bukubrow.json" = chromiumNative;
        "google-chrome/NativeMessagingHosts/com.samhh.bukubrow.json" = chromiumNative;
        "chromium/NativeMessagingHosts/com.samhh.bukubrow.json" = chromiumNative;
        "vivaldi/NativeMessagingHosts/com.samhh.bukubrow.json" = chromiumNative;
      };
      files = {
        ".mozilla/native-messaging-hosts/com.samhh.bukubrow.json" = firefoxNative;
        ".librewolf/native-messaging-hosts/com.samhh.bukubrow.json" = firefoxNative;
      };
    }
  )
)
