args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
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
            "editor.fontFamily" = "monospace";
            "editor.fontSize" = "16";
          };
        };
        package = pkgs.vscodium;
      };
      enable = [
        # keep-sorted start
        "even_better_toml"
        "nix-ide"
        "vim"
        # keep-sorted end
      ];
    }
  )
)
