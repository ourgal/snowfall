{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bottles"
      "moonlight-qt"
      "prismlauncher"
      "wine"
      # keep-sorted end
    ];
  }
)
