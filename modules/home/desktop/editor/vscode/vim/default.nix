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
                "f"
              ];
              "commands" = [ "workbench.action.quickOpen" ];
            }
            {
              "before" = [
                "<leader>"
                "g"
              ];
              "commands" = [ "fugitive.open" ];
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
              "before" = [ "<C-j>" ];
              "after" = [
                "<C-w>"
                "j"
              ];
            }
            {
              "before" = [ "<C-k>" ];
              "after" = [
                "<C-w>"
                "k"
              ];
            }
            {
              "before" = [ "<C-l>" ];
              "after" = [
                "<C-w>"
                "l"
              ];
            }
            {
              "before" = [ "<C-h>" ];
              "after" = [
                "<C-w>"
                "h"
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
