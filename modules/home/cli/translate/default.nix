{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "crow-translate"
      "gtt"
      "opencc"
      "udict"
      "ydict"
    ];
    myPkgs = "pot";
    enable = "translate-shell";
  }
)
