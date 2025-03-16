args:
args.module (
  args
  // (
    let
      inherit (args) pkgs config namespace;
      clash = pkgs.writeShellScript "clash-proxy" ''
        if [ "$(curl -s 'http://192.168.123.1:9999/proxies' | jq '.proxies.["🐟 漏网之鱼"].["now"]')" = "\"DIRECT\"" ]; then
          echo "proxy"
          curl 'http://192.168.123.1:9999/proxies/%F0%9F%90%9F%20%E6%BC%8F%E7%BD%91%E4%B9%8B%E9%B1%BC' -X PUT --data-raw $'{"name":"🚀 节点选择"}'
        else
          echo "direct"
          curl 'http://192.168.123.1:9999/proxies/%F0%9F%90%9F%20%E6%BC%8F%E7%BD%91%E4%B9%8B%E9%B1%BC' -X PUT --data-raw $'{"name":"DIRECT"}'
        fi
      '';
    in
    {
      path = ./.;
      nixPkgs = "just";
      progs.fish.functions.".j" = {
        body = "just --justfile ~/.user.justfile --working-directory . $argv";
        description = "user just";
      };
      files.".user.justfile" =
        ''
          defualt: help

          wttr:
            @cache -s "$(date +%Y-%m-%d)" -- curl -s 'https://wttr.in/'

          wan:
            @cache -s "$(date +%Y-%m-%d)" -- curl -s 'https://ifconfig.io/'

          lan:
            @ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'

          text text:
            @echo "{{ text }}" | curl -F file=@- 0x0.st

          url url:
            @curl -F url={{ url }} https://shorta.link

          file file:
            @curl -F file=@{{ file }} https://0x0.st

          clash:
            @${clash}

          yt-rss url:
            @curl -s '{{url}}' | rg -o '\"(https://www.youtube.com/feeds/videos.xml\?channel_id=.*?)\"' -r '$1' | cut -d \n -f 1 | xclip -sel clip

          dl:
            @aria2c --input-file <(xclip -o -sel clip)

          mpv:
            @mpv "$(xclip -o -sel clip)"

          help:
            @just --list --justfile ~/.user.justfile
        ''
        + (
          if config.${namespace}.cli.multiplexer.tmux.enable then
            ''
              fixTmux:
                @${config.home.homeDirectory}/.tmux/resurrect/fixSymlink
            ''
          else
            ""
        );
    }
  )
)
