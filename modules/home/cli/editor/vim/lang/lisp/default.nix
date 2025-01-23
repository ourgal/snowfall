args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "parinfer-rust"
      "vlime"
      # keep-sorted end
    ];
    disable = "slimv";
  }
)
