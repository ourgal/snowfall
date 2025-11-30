{
  myPkgs = "wait-for";
  perlPkgs = "vidir";
  nixPkgs = [
    # keep-sorted start
    "coreutils-full"
    "empty"
    "parallel-full"
    "progress"
    "retry"
    "rush"
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
    "dd"
    "df"
    "du"
    "find"
    "grep"
    "kill"
    "less"
    "ls"
    "mv"
    "nohup"
    "pipe"
    "ps"
    "rm"
    "sed"
    "tee"
    "time"
    "touch"
    "tree"
    "uniq"
    "watch"
    "which"
    # keep-sorted end
  ];
  files.".parallel/will-cite" = "";
}
