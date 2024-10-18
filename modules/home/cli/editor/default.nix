{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "vim-full";
    enable = [
      # keep-sorted start
      "helix"
      "kakoune"
      "nixvim"
      # keep-sorted end
    ];
  }
)
