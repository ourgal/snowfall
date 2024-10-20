args:
args.module (
  args
  // {
    path = ./.;
    progs.vscode = {
      mutableExtensionsDir = false;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 1000;
        "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Fira Code', monospace";
      };
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
