args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "bafi"
      "config-file-validator"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "dasel"
      "faq"
      # keep-sorted end
    ];
  }
)
