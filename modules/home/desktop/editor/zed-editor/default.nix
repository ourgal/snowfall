args:
args.module (
  args
  // (
    let
      inherit (args) lib;
    in
    {
      progs.zed-editor = {
        extensions = [
          # keep-sorted start
          "autocorrect"
          "caddyfile"
          "catppuccin"
          "fish"
          "html"
          "just"
          "make"
          "nix"
          "scls"
          "tmux"
          "tokyo-night"
          # keep-sorted end
        ];
        userSettings = {
          lsp =
            let
              default = {
                binary = {
                  path_lookup = true;
                };
              };
              servers = [
                "nil"
                "scls"
              ];
            in
            builtins.foldl' (acc: v: acc // { ${v} = default; }) { } servers;
          languages = {
            Nix = {
              language_serves = [
                "nil"
                "scls"
              ];
              format_on_save = {
                external = {
                  command = "nixfmt";
                  arguments = [
                    "--strict"
                    "-"
                  ];
                };
              };
            };
          };
          features = {
            copilot = false;
          };
          telemetry = {
            metrics = false;
          };
          vim_mode = true;
          ui_font_size = lib.mkDefault 16;
          buffer_font_size = lib.mkDefault 16;
          autosave = "on_focus_change";
          auto_update = false;
          buffer_font_family = lib.mkDefault "monospace";
          theme = lib.mkDefault {
            mode = "dark";
            dark = "Tokyo Night";
            light = "Tokyo Night";
          };
        };
      };
      value.catppuccin.zed.enable = false;
    }
  )
)
