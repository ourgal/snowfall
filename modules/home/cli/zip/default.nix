args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "atool"
      "ouch"
      "p7zip"
      "unrar"
      "unzip"
      "zip"
      # keep-sorted end
    ];
  }
)
