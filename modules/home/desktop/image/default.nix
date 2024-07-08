{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "gimp"
      "viewnior"
    ];
    enable = "feh";
  }
)
