args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [ pkgs.open-vsx.kahole.magit ];
        userSettings = {
          "magit.display-buffer-function" = "same-column";
          "vim.normalModeKeyBindings" = [
            {
              "before" = [
                "<leader>"
                "g"
                "g"
              ];
              "commands" = [ "magit.status" ];
            }
          ];
        };
        keybindings = [
          {
            "key" = "g g";
            "command" = "cursorTop";
            "when" =
              "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
          }
          {
            "key" = "g r";
            "command" = "magit.refresh";
            "when" =
              "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
          }
          {
            "key" = "tab";
            "command" = "extension.vim_tab";
            "when" =
              "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert' && !inlineEditIsVisible && editorLangId != 'magit'";
          }
          {
            "key" = "tab";
            "command" = "-extension.vim_tab";
          }
          {
            "key" = "x";
            "command" = "magit.discard-at-point";
            "when" =
              "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
          }
          {
            "key" = "k";
            "command" = "-magit.discard-at-point";
          }
          {
            "key" = "-";
            "command" = "magit.reverse-at-point";
            "when" =
              "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
          }
          {
            "key" = "v";
            "command" = "-magit.reverse-at-point";
          }
          {
            "key" = "shift+-";
            "command" = "magit.reverting";
            "when" =
              "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
          }
          {
            "key" = "shift+v";
            "command" = "-magit.reverting";
          }
          {
            "key" = "shift+o";
            "command" = "magit.resetting";
            "when" =
              "editorTextFocus && editorLangId == 'magit' && vim.mode =~ /^(?!SearchInProgressMode|CommandlineInProgress).*$/";
          }
          {
            "key" = "shift+x";
            "command" = "-magit.resetting";
          }
          {
            "key" = "x";
            "command" = "-magit.reset-mixed";
          }
          {
            "key" = "ctrl+u x";
            "command" = "-magit.reset-hard";
          }
        ];
      };
    }
  )
)
