{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = with args; {
      newsboat = {
        enable = true;
        autoReload = true;
        browser = "${pkgs.${namespace}.newsboat-open}/bin/newsboat-open";
        extraConfig = ''
          show-read-feeds no
          color info default default reverse
          color listnormal_unread yellow default
          color listfocus blue default reverse bold
          color listfocus_unread blue default reverse bold

          bind-key j down feedlist
          bind-key k up feedlist
          bind-key j next articlelist
          bind-key k prev articlelist
          bind-key J next-feed articlelist
          bind-key K prev-feed articlelist
          bind-key j down article
          bind-key k up article

          urls-source "freshrss"
          freshrss-url "http://freshrss.zxc.cn/api/greader.php"
          freshrss-login "admin"
          freshrss-password "${lib.strings.fileContents ./password.key}"
        '';
      };
    };
  }
)
