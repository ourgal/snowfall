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
      "kill"
      "ls"
      "mv"
      "ps"
      "rm"
      "sed"
      "time"
      "tree"
      "watch"
      # keep-sorted end
    ];
  }
)
