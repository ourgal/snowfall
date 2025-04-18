args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs.vscode = {
        mutableExtensionsDir = false;
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        userSettings = {
          "files.autoSave" = "afterDelay";
          "files.autoSaveDelay" = 1000;
          "editor.fontFamily" = "monospace";
          "editor.fontSize" = "16";
        };
        package = pkgs.vscodium;
      };
      enable = [
        # keep-sorted start
        "catppuccin"
        "even_better_toml"
        "fugitive"
        "nix-ide"
        "vim"
        # keep-sorted end
      ];
    }
  )
)
