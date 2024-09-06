{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "lego"
      "mkcert"
      # keep-sorted end
    ];
  }
)
