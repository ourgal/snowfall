{
  config,
  lib,
  pkgs,
  namespace,
  ...
}:
let
  inherit (lib) mkIf types isString;
  inherit (lib.${namespace})
    cfgHome
    mkOpt'
    enabled
    defaultTypes
    ;
  cfg = cfgHome config.${namespace} ./.;
  fileTypes = [
    "x-scheme-handler/http"
    "x-scheme-handler/https"
    "x-scheme-handler/chrome"
    "text/html"
    "application/x-extension-htm"
    "application/x-extension-html"
    "application/x-extension-shtml"
    "application/x-extension-xhtml"
    "application/x-extension-xht"
    "application/xhtml+xml"
  ];
  defaults = defaultTypes "${cfg.browser}.desktop" fileTypes;
in
{
  options.${namespace}.user = with types; {
    name = mkOpt' str "zxc";
    browser = mkOpt' str "firefox";
    editor = mkOpt' str "hx";
  };

  config = mkIf (isString cfg.name) {
    catppuccin = enabled // {
      accent = "blue";
      flavor = "macchiato";
    };
    xdg.mimeApps = enabled // {
      associations.added = defaults;
      defaultApplications = defaults;
    };
    home = {
      username = cfg.name;
      homeDirectory = "/home/${config.home.username}";
      sessionVariables = {
        EDITOR = cfg.editor;
      };
      stateVersion = "23.11";
    };
    home.file = {
      ".mailcap".text = ''
        # media
        video/*; ${pkgs.mpv}/bin/mpv "%s"
        audio/mpeg; ${pkgs.mpv}/bin/mpv --no-video "%s"
        image/*; ${pkgs.feh}/bin/feh "%s"

        # text
        # text/html; ${pkgs.w3m}/bin/w3m "%s"
        text/html; open -a Firefox "%s"
        text/plain; ${pkgs.helix}/bin/hx "%s"

        # fallback to vim
        text/*; ${pkgs.helix}/bin/hx "%s"
      '';
    };
  };
}
