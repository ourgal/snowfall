{ ... }@args:
args.module (
  args
  // (
    with args;
    let
      chromeLikeBrowser = "${pkgs.chromium}/bin/chromium";
      singleton = "${pkgs.${namespace}.singleton}/bin/singleton";
      webapp_common = ''
        if [[ $# -lt 2 || "$1" == "-h" ]]
        then
          echo "Usage: ''${0##*/} <window> <url>"
          echo "  Only start a webapp once, if the app is running"
          echo "  then bring it to foreground"
          exit 0
        fi

        # check URL prefix
        URL=$2
        if [[ "$URL" =~ ^~ ]]
        then
          URL="file://$HOME/''${URL#\~/}"
        fi
        if [[ "$URL" =~ ^\/ ]]
        then
          URL="file://$URL"
        fi
        if [[ "$URL" =~ ^(file|https?)?:\/\/ ]]
        then
          true
        else
          URL="https://$URL"
        fi
      '';
      webapp = pkgs.writeShellScriptBin "webapp.sh" ''
        ${webapp_common}
        ${singleton} "$1" ${chromeLikeBrowser} --start-fullscreen --app="$URL"
      '';
      webapp_no_cors = pkgs.writeShellScriptBin "webapp_no_cors.sh" ''
        ${webapp_common}
        ${singleton} "$1" ${chromeLikeBrowser} --start-fullscreen --user-data-dir=~/.chrome_no_cors --disable-web-security --app="$URL"
      '';
      webapp_sh = "${webapp}/bin/webapp.sh";
      webapp_no_cors_sh = "${webapp_no_cors}/bin/webapp_no_cors.sh";
      yacd = pkgs.writeShellScriptBin "yacd" ''${webapp_sh} "yacd" "http://192.168.123.1:9999/ui/#/proxies"'';
    in
    {
      path = ./.;
      value = {
        home.packages = with pkgs; [
          xdotool
          chromium
          singleton
          webapp
          webapp_no_cors
          yacd
        ];
      };
    }
  )
)
