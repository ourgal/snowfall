# Home user settings

```nix tangle:default.nix
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
```

Set default browser.
`defaultTypes` is a function, `mime.html` is a attr set.

```nix tangle:default.nix
  defaults = defaultTypes "${cfg.browser}.desktop" mime.html;
in
{
```

Some settings.

```nix tangle:default.nix
  options.${namespace}.user = with types; {
    name = mkOpt' str "zxc";
    browser = mkOpt' str "firefox";
    editor = mkOpt' str "hx";
    terminal = mkOpt' str "wezterm";
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
```

Don't change this.

```nix tangle:default.nix
        stateVersion = "23.11";
```

Mailcap config

```nix tangle:default.nix
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
```

Defaut mime settings.

```nix tangle:default.nix
    // defaults
  );
}
```
