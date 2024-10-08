{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = "udiskie";
    nixPkgs = [
      # keep-sorted start
      "compsize"
      "ventoy-bin-full"
      # keep-sorted end
    ];
  }
)
