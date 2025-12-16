args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [ pkgs.nix-vscode-extensions.vscode-marketplace.hnrk-str.vscode-fugitive ];
        userSettings = {
          "vim.normalModeKeyBindings" = [
            {
              "before" = [
                "<leader>"
                "g"
                "g"
              ];
              "commands" = [ "fugitive.open" ];
            }
            {
              "before" = [ "q" ];
              "commands" = [ "fugitive.close" ];
              "when" = "(vim.mode == 'Normal' || !vim.mode) && resourceScheme == fugitive && editorTextFocus";
            }
            {
              "command" = "fugitive.toggleInlineDiff";
              "key" = "tab";
              "when" = "(vim.mode == 'Normal' || !vim.mode) && resourceScheme == fugitive && editorTextFocus";
            }
          ];
        };
      };
    }
  )
)
