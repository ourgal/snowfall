{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "clipqr"
      "qrcp"
      "qrscan"
      # keep-sorted end
    ];
    pyPkgs = "qrcode";
  }
)
