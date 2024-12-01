args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "wait-for";
    nixPkgs = [
      # keep-sorted start
      "coreutils-full"
      "loop"
      "moreutils"
      "progress"
      "retry"
      "wait4x"
      "with-shell"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "alias"
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
      "uniq"
      "watch"
      "which"
      # keep-sorted end
    ];
  }
)
