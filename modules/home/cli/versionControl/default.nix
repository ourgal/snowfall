{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "gitu"
      "tig"
      "tokei"
    ];
    enable = [
      "gh"
      "git"
      "gitui"
      "jujutsu"
      "lazygit"
    ];
  }
)
