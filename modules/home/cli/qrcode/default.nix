args:
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
    pyPkgs = [
      # keep-sorted start
      "qrcode"
      "segno"
      # keep-sorted end
    ];
  }
)
