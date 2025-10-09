{
  config,
  lib,
  namespace,
  options,
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
  duplicateTmuxKeys = lib.pipe options.${namespace}.user.tmux.keys.definitionsWithLocations [
    (lib.concatMap (
      entry:
      map (key: {
        inherit (entry) file;
        inherit key;
      }) entry.value
    ))
    (builtins.groupBy (entry: entry.key))
    (lib.filterAttrs (_key: entries: builtins.length entries > 1))
    (lib.mapAttrsToList (
      key: entries:
      "Duplicate tmux key ${key} found in:\n"
      + lib.concatMapStrings (entry: "  - ${entry.file}\n") entries
    ))
    lib.concatStrings
  ];
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
    tmux = {
      keys = mkOpt' (listOf str) [ ];
    };
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
      assertions = [
        {
          assertion = duplicateTmuxKeys == "";
          message = duplicateTmuxKeys;
        }
      ];
    }
    // defaults
  );
}
