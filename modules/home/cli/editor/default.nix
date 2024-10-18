{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "helix"
      "kakoune"
      "nixvim"
      "vim"
      # keep-sorted end
    ];
  }
)
