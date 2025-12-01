args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        lib
        namespace
        host
        config
        ;
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
      isWork = builtins.elem host lib.${namespace}.settings.work;
      quickmarks = pkgs.runCommand "qutebrowserQuickmarks" { buildInputs = [ pkgs.buku ]; } ''
          mkdir temp
          ln -s ${config.${namespace}.cli.bookmark.buku.db.path} temp/bookmarks.db
          export BUKU_DEFAULT_DBDIR=temp
        	buku --nostdin --export buku.md
        	sed -i -E 's/- \[(.+)\]\((.+)\)(.+)?/"\1" = "\2"/' buku.md
        	mv buku.md $out
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
        searchEngines = if !isWork then lib.importTOML ./searchEngines.key else { };
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
        quickmarks = if !isWork then lib.importTOML quickmarks else { };
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
