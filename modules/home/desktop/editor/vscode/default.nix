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
          };
        };
        package = pkgs.vscodium;
      };
      enable = [
        # keep-sorted start
        "ansible"
        "even_better_toml"
        "nix-ide"
        "vim"
        # keep-sorted end
      ];
    }
  )
)
