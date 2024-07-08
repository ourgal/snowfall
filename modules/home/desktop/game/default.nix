{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "bottles"
      "prismlauncher"
      "wine"
    ];
  }
)
