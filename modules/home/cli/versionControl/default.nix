{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gitu"
      "tig"
      "tokei"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "gh"
      "gitui"
      "jujutsu"
      "lazygit"
      {
        git = {
          hook = args.enabled;
        };
      }
      # keep-sorted end
    ];
  }
)
