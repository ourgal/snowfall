args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      wrapper = pkgs.writeShellScriptBin "gopass_wrapper.sh" ''
        export PATH="$PATH:$HOME/.nix-profile/bin" # required for Nix
        export PATH="$PATH:/usr/local/bin" # required on MacOS/brew
        export PATH="$PATH:/usr/local/MacGPG2/bin" # required on MacOS/GPGTools GPGSuite
        export GPG_TTY="$(tty)"

        # Uncomment to debug gopass-jsonapi
        # export GOPASS_DEBUG_LOG=/tmp/gopass-jsonapi.log

        if [ -f ~/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
          source ~/.gpg-agent-info
          export GPG_AGENT_INFO
        else
          eval $(gpg-agent --daemon)
        fi

        export PATH="$PATH:/usr/local/bin"

        ${pkgs.gopass-jsonapi}/bin/gopass-jsonapi listen

        exit $?
      '';
      chromiumNative = {
        name = "com.justwatch.gopass";
        description = "Gopass wrapper to search and return passwords";
        path = "${wrapper}/bin/gopass_wrapper.sh";
        type = "stdio";
        allowed_origins = [ "chrome-extension://kkhfnlkhiapbiehimabddjbimfaijdhk/" ];
      };
      firefoxNative = {
        name = "com.justwatch.gopass";
        description = "Gopass wrapper to search and return passwords";
        path = "${wrapper}/bin/gopass_wrapper.sh";
        type = "stdio";
        allowed_extensions = [ "{eec37db0-22ad-4bf1-9068-5ae08df8c7e9}" ];
      };
    in
    {
      nixPkgs =
        p: with p; [
          # keep-sorted start
          git-credential-gopass
          gopass
          gopass-jsonapi
          passExtensions.pass-import
          # keep-sorted end
        ];
      progs = {
        git.settings.credential.helper = "gopass";
      };
      confs = {
        "BraveSoftware/Brave-Browser/NativeMessagingHosts/com.justwatch.gopass.json" = chromiumNative;
        "google-chrome/NativeMessagingHosts/com.justwatch.gopass.json" = chromiumNative;
        "chromium/NativeMessagingHosts/com.justwatch.gopass.json" = chromiumNative;
        "vivaldi/NativeMessagingHosts/com.justwatch.gopass.json" = chromiumNative;
      };
      files = {
        ".mozilla/native-messaging-hosts/com.justwatch.gopass.json" = firefoxNative;
        ".librewolf/native-messaging-hosts/com.justwatch.gopass.json" = firefoxNative;
      };
      enable = "browserpass";
    }
  )
)
