args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs;
      inherit (args.config.${namespace}.user) terminal browser browserS;
      hostConfig =
        if (args.host == "home") then # lua
          ''
            local awful = require("awful")
            awful.spawn("${terminal}", { screen = 1, tag = "1" })
            awful.spawn("${browser}", { screen = 1, tag = "2" })
            awful.spawn("${terminal}", { screen = 2, tag = "1" })
            awful.spawn("${browserS}", { screen = 2, tag = "2" })
          ''
        # lua
        else
          ''
            local awful = require("awful")
            awful.spawn("${terminal}")
          '';
      finalConfig = hostConfig;
      awesome_layout = n: "${pkgs.awesome-git}/share/awesome/themes/default/layouts/${n}.png";
      awesome_icons = ''
        return {
          layout_fairh = "${awesome_layout "fairhw"}"
          layout_fairv = "${awesome_layout "fairvw"}"
          layout_floating = "${awesome_layout "floatingw"}"
          layout_magnifier = "${awesome_layout "magnifierw"}"
          layout_max = "${awesome_layout "maxw"}"
          layout_fullscreen = "${awesome_layout "fullscreenw"}"
          layout_tilebottom = "${awesome_layout "tilebottomw"}"
          layout_tileleft = "${awesome_layout "tileleftw"}"
          layout_tile = "${awesome_layout "tilew"}"
          layout_tiletop = "${awesome_layout "tiletopw"}"
          layout_spiral = "${awesome_layout "spiralw"}"
          layout_dwindle = "${awesome_layout "dwindlew"}"
          layout_cornernw = "${awesome_layout "cornernw"}"
          layout_cornerne = "${awesome_layout "cornerne"}"
          layout_cornersw = "${awesome_layout "cornersw"}"
          layout_cornerse = "${awesome_layout "cornerse"}"
        }
      '';
    in
    {
      myPkgs = [
        # keep-sorted start
        "caskaydiaCove-nerd-font"
        "ubuntu-nerd-font"
        # keep-sorted end
      ];
      xfcePkgs = "thunar";
      nixPkgs = [
        # keep-sorted start
        "gpick"
        "keepassxc"
        "lxappearance"
        "networkmanagerapplet"
        "nitrogen"
        "scrot"
        "vokoscreen-ng"
        "xss-lock"
        # keep-sorted end
      ];
      value = {
        home.file = {
          ".icons/Tela".source = "${args.pkgs.tela-icon-theme}/share/icons/Tela";
          ".icons/Papirus".source = "${args.pkgs.papirus-icon-theme}/share/icons/Papirus";
          ".icons/Zafiro-Icons-Dark-Blue-f".source =
            "${args.pkgs.zafiro-icons}/share/icons/Zafiro-icons-Dark";
        };
      };
      dot.desktop.system.nm-applet.enable = true;
      confs = [
        { "awesome/autostart.lua" = finalConfig; }
        { "awesome/awesome_icons.lua" = awesome_icons; }
        {
          awesome = [
            ./rc.lua
            ./overflow.lua
            ./fancy_taglist.lua
            ./settings.lua
            ./binding
            ./deco
            ./layout
            ./main
            ./popups
            ./themes
            ./Wallpapers
          ];
        }
      ];
    }
  )
)
