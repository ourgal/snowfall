args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "lisp"
      "markdown"
      "python"
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "csv"
      "dhall"
      "go"
      "jq"
      "latex"
      "rst"
      "zig"
      # keep-sorted end
    ];
  }
)
