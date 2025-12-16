args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs.vscode = {
        mutableExtensionsDir = false;
        profiles.default = {
          enableExtensionUpdateCheck = false;
          enableUpdateCheck = false;
          userSettings = {
            "files.autoSave" = "afterDelay";
            "files.autoSaveDelay" = 1000;
            "editor.fontFamily" = lib.mkDefault "monospace";
            "editor.fontSize" = lib.mkDefault 16;
            "editor.wordWrap" = "on";
            "workbench.tree.enableStickyScroll" = false;
            "workbench.tree.renderIndentGuides" = "none";
            "workbench.tree.indent" = 8;
            "explorer.compactFolder" = false;
            "explorer.confirmDragAndDrop" = false;
            "explorer.confirmDelete" = false;
          };
          keybindings = [
            {
              "key" = "tab";
              "command" = "-acceptSelectedSuggestion";
              "when" = "suggestWidgetHasFocusedSuggestion && suggestWidgetVisible && textInputFocus";
            }
            {
              "key" = "tab";
              "command" = "selectNextSuggestion";
              "when" =
                "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus && !inSnippetMode";
            }
            {
              "key" = "shift+tab";
              "command" = "selectPrevSuggestion";
              "when" =
                "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus && !inSnippetMode";
            }
          ];
        };
        package = pkgs.vscodium;
      };
      enable = [
        # keep-sorted start
        "ansible"
        "even_better_toml"
        "fugitive"
        "material-icon-theme"
        "nix-ide"
        "vim"
        "vscode-snippets-for-ansible"
        "vsnetrw"
        # keep-sorted end
      ];
    }
  )
)
