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
      "wifi-qr"
      # keep-sorted end
    ];
    pyPkgs = "qrcode";
  }
)
