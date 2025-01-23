args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "lisp"
      "markdown"
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "csv"
      "dhall"
      "go"
      "latex"
      "rst"
      # keep-sorted end
    ];
  }
)
