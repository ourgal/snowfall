args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "jsonnet"
      "jsonnet-language-server"
      # keep-sorted end
    ];
  }
)
