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
      "git"
      "gitui"
      "jujutsu"
      "lazygit"
    ];
  }
)
