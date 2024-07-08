{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "curlie"
      "htmlq"
      "httpie"
      "xh"
    ];
  }
)
