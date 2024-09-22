{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      chromiumNative = {
        name = "com.samhh.bukubrow";
        description = "Bukubrow is a WebExtension for Buku, a command-line bookmark manager. This is the corresponding host that facilitates interfacing with the Buku database via native messaging.";
        path = "${pkgs.bukubrow}/bin/bukubrow";
        type = "stdio";
        allowed_origins = [ "chrome-extension://ghniladkapjacfajiooekgkfopkjblpn/" ];
      };
      firefoxNative = {
        name = "com.samhh.bukubrow";
        description = "Bukubrow is a WebExtension for Buku, a command-line bookmark manager. This is the corresponding host that facilitates interfacing with the Buku database via native messaging.";
        path = "${pkgs.bukubrow}/bin/bukubrow";
        type = "stdio";
        allowed_extensions = [ "bukubrow@samhh.com" ];
      };
    in
    {
      path = ./.;
      nixPkgs = [
        "buku"
        "bukubrow"
      ];
      progs = {
        fish = {
          shellAbbrs = {
            bb = "buku";
          };
          functions = {
            fzf-buku = {
              body = ''
                # Save newline-separated string into an array
                set -l website (buku -p -f 5 | column -ts\t | fzf --multi)

                # Open each website
                for i in $website
                    set index (echo "$i" | awk '{print $1}')
                    buku -p $index
                    buku -o $index
                end
              '';
              description = "fzf buku";
            };
          };

        };
      };
      confs = {
        "BraveSoftware/Brave-Browser/NativeMessagingHosts/com.samhh.bukubrow.json" = builtins.toJSON chromiumNative;
        "google-chrome/NativeMessagingHosts/com.samhh.bukubrow.json" = builtins.toJSON chromiumNative;
        "chromium/NativeMessagingHosts/com.samhh.bukubrow.json" = builtins.toJSON chromiumNative;
        "vivaldi/NativeMessagingHosts/com.samhh.bukubrow.json" = builtins.toJSON chromiumNative;
      };
      files = {
        ".mozilla/native-messaging-hosts/com.samhh.bukubrow.json" = builtins.toJSON firefoxNative;
        ".librewolf/native-messaging-hosts/com.samhh.bukubrow.json" = builtins.toJSON firefoxNative;
      };
    }
  )
)
