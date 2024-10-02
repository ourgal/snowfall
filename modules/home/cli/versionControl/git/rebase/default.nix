{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-interactive-rebase-tool"
      # keep-sorted end
    ];
    progs = {
      git.extraConfig = {
        sequence.editor = "interactive-rebase-tool";
        interactive-rebase-tool = {
          inputMoveDown = "Down j";
          inputMoveUp = "Up k";
          inputMoveSelectionDown = "l";
          inputMoveSelectionUp = "h";
          inputUndo = "u";
          inputRedo = "Control+r";
        };
      };
    };
  }
)
