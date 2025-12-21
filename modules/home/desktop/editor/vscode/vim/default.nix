args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [ pkgs.open-vsx.vscodevim.vim ];
        userSettings = {
          "vim.leader" = "<space>";
          "vim.normalModeKeyBindings" = [
            {
              "before" = [
                "<leader>"
                "<space>"
              ];
              "commands" = [ "workbench.action.quickOpen" ];
            }
            {
              "before" = [
                "<leader>"
                "."
              ];
              "commands" = [ "workbench.action.tasks.build" ];
            }
            {
              "before" = [ "K" ];
              "commands" = [ "editor.action.showHover" ];
            }
            {
              "before" = [ "H" ];
              "commands" = [ ":bp" ];
            }
            {
              "before" = [ "L" ];
              "commands" = [ ":bn" ];
            }
            {
              "before" = [
                "<leader>"
                "w"
                "j"
              ];
              "after" = [
                "<C-w>"
                "j"
              ];
            }
            {
              "before" = [
                "<leader>"
                "w"
                "k"
              ];
              "after" = [
                "<C-w>"
                "k"
              ];
            }
            {
              "before" = [
                "<leader>"
                "w"
                "l"
              ];
              "after" = [
                "<C-w>"
                "l"
              ];
            }
            {
              "before" = [
                "<leader>"
                "w"
                "h"
              ];
              "after" = [
                "<C-w>"
                "h"
              ];
            }
            {
              "before" = [
                "<leader>"
                "w"
                "v"
              ];
              "after" = [
                "<C-w>"
                "v"
              ];
            }
            {
              "before" = [
                "<leader>"
                "w"
                "s"
              ];
              "after" = [
                "<C-w>"
                "s"
              ];
            }
          ];
          "extensions.experimental.affinity" = {
            "vscodevim.vim" = 1;
          };
        };
      };
    }
  )
)
