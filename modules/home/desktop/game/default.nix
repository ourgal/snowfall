args:
args.module (
  args
  // {
    path = ./.;
    gnomePkgs = "gnome-mahjongg";
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
