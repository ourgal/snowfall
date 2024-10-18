{
  config,
  lib,
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
    terminal = mkOpt' str "wezterm";
    browserS = mkOpt' str "brave";
    browserSS = mkOpt' str "qutebrowser";
    pager = mkOpt' str "moar";
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
        PAGER = cfg.pager;
      };
      stateVersion = "23.11";
    };
    home.file = {
      ".mailcap".text = ''
        # media
        video/*; mpv "%s"
        audio/mpeg; mpv --no-video "%s"
        image/*; feh "%s"

        # text
        # text/html; w3m "%s"
        text/html; open -a Firefox "%s"
        text/plain; hx "%s"

        text/*; hx "%s"
      '';
    };
  };
}
