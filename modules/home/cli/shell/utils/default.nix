{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "cat"
      "cp"
      "cut"
      "df"
      "du"
      "find"
      "grep"
      "ls"
      "mv"
      "ps"
      "rm"
      "sed"
      "time"
      "watch"
      # keep-sorted end
    ];
  }
)
