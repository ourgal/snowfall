args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib namespace;
      copyHintText = pkgs.writeShellScript "qutebrowserCopyHintText" ''
        echo -n "$QUTE_SELECTED_TEXT" | xsel -b
      '';
      copySelecetText = pkgs.writeShellScript "qutebrowserCopySelecetText" ''
        if [ -n "$QUTE_SELECTED_TEXT" ]; then
          echo -n "$QUTE_SELECTED_TEXT" | xsel -b
        else
          echo -n "$QUTE_URL" | xsel -b
        fi
      '';
    in
    {
      progs.qutebrowser = {
        settings = {
          auto_save.session = true;
          colors.webpage.darkmode.enabled = true;
          colors.webpage.darkmode.policy.images = "never";
          content.blocking.method = "both";
          downloads.location.suggestion = "both";
        };
        searchEngines = lib.importTOML ./searchEngines.key;
        keyBindings = {
          normal = {
            M = "hint links spawn -d mpv {hint-url}";
            "<Ctrl-o>" = lib.mkMerge [
              "session-save"
              "cmd-set-text -s :session-load -c"
            ];
            ya = "hint links yank";
            yt = "hint links userscript ${copyHintText}";
            yy = "spawn --userscript ${copySelecetText}";
            "<Alt-m>" = "tab-mute";
            c = "tab-prev";
            v = "tab-next";
            o = "cmd-set-text -s :open";
            g = "cmd-set-text -s :open -t";
            z = "undo";
            x = "tab-close";
            X = "close";
            r = "reload";
            a = "back";
            d = "forward";
            b = "cmd-set-text -s :quickmark-load -t ";
            B = "cmd-set-text -s :open -t dict ";
            e = "cmd-set-text -s :open {url}";
            "." = "search-next";
            "," = "search-prev";
            ">" = "tab-move +";
            "<" = "tab-move -";
            s = "scroll-page 0 1";
            w = "scroll-page 0 -1";
            S = "scroll-to-perc 100";
            W = "scroll-to-perc 0";
            u = "navigate up";
            p = "open -t {clipboard}";
            "\\\\r" = ''clear-messages ;; jseval document.querySelector("video, audio").playbackRate = 2'';
            "\\\\z" = ''clear-messages ;; jseval document.querySelector("video, audio").playbackRate = 1'';
            "\\\\q" = "spawn --userscript qr";
            "\\\\p" = "spawn --userscript qute-pass --mode gopass";
            tt = "spawn --userscript ${pkgs.${namespace}.qute-translate-popup}/bin/translate --target_lang zh";
          };
        };
        quickmarks = lib.importTOML ./quickmarks.key;
        greasemonkey =
          let
            go = name: pkgs.writeText "${name}.js" (builtins.readFile ./${name}.js);
          in
          [
            (go "search_redirect")
            (go "find_on_nyaa")
            (go "youtube_sponsorblock")
            (go "youtube_fullscreen")
          ];
      };
    }
  )
)
