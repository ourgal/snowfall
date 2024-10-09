{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "clipqr"
      "qrcode"
      "qrcp"
      "qrscan"
      "qrtool"
      "wifi-qr"
      # keep-sorted end
    ];
    pyPkgs = "qrcode";
  }
)
