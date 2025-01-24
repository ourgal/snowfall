args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "just"
      "lisp"
      "markdown"
      "python"
      # keep-sorted end
    ];
    disable = [
      # keep-sorted start
      "csv"
      "dhall"
      "fish"
      "go"
      "jq"
      "latex"
      "rst"
      "sql"
      "zig"
      # keep-sorted end
    ];
  }
)
