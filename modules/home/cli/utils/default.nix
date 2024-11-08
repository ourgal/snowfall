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
      "with-shell"
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
      "which"
      # keep-sorted end
    ];
  }
)
