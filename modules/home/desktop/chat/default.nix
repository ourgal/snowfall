{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "element-desktop"
      "telegram-desktop"
    ];
  }
)
