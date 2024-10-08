{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "atool"
      "ouch"
      "p7zip"
      "unrar"
      "unzip"
    ];
  }
)
