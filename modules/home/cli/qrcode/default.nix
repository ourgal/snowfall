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
      "qrtool"
      "wifi-qr"
      # keep-sorted end
    ];
    pyPkgs = "qrcode";
  }
)
