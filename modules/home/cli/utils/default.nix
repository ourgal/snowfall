args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "coreutils-full"
      "loop"
      "moreutils"
      "progress"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "cat"
      "cd"
      "cp"
      "cut"
      "df"
      "du"
      "find"
      "grep"
      "kill"
      "less"
      "ls"
      "mv"
      "pipe"
      "ps"
      "rm"
      "sed"
      "time"
      "touch"
      "tree"
      "watch"
      # keep-sorted end
    ];
  }
)
