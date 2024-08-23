{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = "adblock";
    progs = {
      qutebrowser = {
        settings = {
          auto_save.session = true;
          colors.webpage.darkmode.enabled = true;
          colors.webpage.darkmode.policy.images = "never";
          content.blocking.method = "both";
          downloads.location.suggestion = "both";
        };
        searchEngines = args.tomlFile ./searchEngines.key;
        keyBindings = {
          normal = {
            "M" = "hint links spawn -d mpv {hint-url}";
            "<Ctrl-o>" = args.lib.mkMerge [
              "session-save"
              "cmd-set-text -s :session-load -c"
            ];
            "ya" = "hint links yank";
            "<Alt-m>" = "tab-mute";
            "c" = "tab-prev";
            "v" = "tab-next";
            "o" = "cmd-set-text -s :open";
            "g" = "cmd-set-text -s :open -t";
            "z" = "undo";
            "x" = "tab-close";
            "X" = "close";
            "r" = "reload";
            "a" = "back";
            "d" = "forward";
            "b" = "cmd-set-text -s :quickmark-load -t ";
            "B" = "cmd-set-text -s :open -t dict ";
            "e" = "cmd-set-text -s :open {url}";
            # "." = "search-next";
            # "," = "search-prev";
            ">" = "tab-move +";
            "<" = "tab-move -";
            "s" = "scroll-page 0 1";
            "w" = "scroll-page 0 -1";
            "S" = "scroll-to-perc 100";
            "W" = "scroll-to-perc 0";
            "u" = "navigate up";
            # "p" = "tab-focus last";
            "pp" = "open -t {clipboard}";
          };
        };
        quickmarks = args.tomlFile ./quickmarks.key;
        greasemonkey = with args.pkgs; [
          (fetchurl {
            url = "https://github.com/afreakk/greasemonkeyscripts/raw/master/youtube_sponsorblock.js";
            sha256 = "sha256-nwNade1oHP+w5LGUPJSgAX1+nQZli4Rhe8FFUoF5mLE=";
          })
          (fetchurl {
            url = "https://update.greasyfork.org/scripts/379776/Find%20on%20Nyaa.user.js";
            sha256 = "sha256-XS309Ym7AQgaPmdkG9tbYEfNT/JuHUiOShbjo0uhs4Q=";
          })
          (fetchurl {
            url = "https://update.greasyfork.org/scripts/459541/YouTube%E5%8E%BB%E5%B9%BF%E5%91%8A.user.js";
            sha256 = "sha256:0g29qmxy77a62bm2zdfir2bscdxfznb431db0s81xbg34iji5zp7";
          })
          (fetchurl {
            url = "https://update.greasyfork.org/scripts/14178/AC-baidu-重定向优化百度搜狗谷歌必应搜索_favicon_双列.user.js";
            sha256 = "sha256-7KfJjzBfmQR4MGl+WIYadP9QA7iUHOnUnFGS6Nv9BZM=";
          })
          (fetchurl {
            url = "https://update.greasyfork.org/scripts/434075/Youtube%20Fullscreen%20Mode.user.js";
            sha256 = "sha256-tE+rXGzo8gsrYvmVsDaiduW6mjOQVim/bx6cjhV40a0=";
          })
        ];
      };
    };
  }
)
