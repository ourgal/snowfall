args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.vscode.profiles.default = {
        extensions = [ pkgs.nix-vscode-extensions.vscode-marketplace.danprince.vsnetrw ];
        userSettings = {
          "vim.normalModeKeyBindings" = [
            {
              "before" = [ "-" ];
              "commands" = [ "vsnetrw.open" ];
              "when" = "editorLangId != vsnetrw";
            }
          ];
        };
      };
    }
  )
)
