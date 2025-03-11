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
    mime
    ;
  cfg = cfgHome config.${namespace} ./.;
  defaults = defaultTypes "${cfg.browser}.desktop" mime.html;
in
{
  options.${namespace}.user = with types; {
    name = mkOpt' str "zxc";
    browser = mkOpt' str "firefox";
    editor = mkOpt' str "hx";
    terminal = mkOpt' str "kitty";
    browserS = mkOpt' str "brave";
    browserSS = mkOpt' str "qutebrowser";
    pager = mkOpt' str "moar";
  };

  config = mkIf (isString cfg.name) (
    {
      catppuccin = enabled // {
        accent = "blue";
        flavor = "macchiato";
      };
      home = {
        username = cfg.name;
        homeDirectory = "/home/${config.home.username}";
        sessionVariables = {
          EDITOR = cfg.editor;
          PAGER = cfg.pager;
          TERMINAL = cfg.terminal;
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
    }
    // defaults
  );
}
