{
  nixPkgs = "grit";
  myPkgs = "rust-kanban";
  enable = [
    # keep-sorted start
    "taskwarrior"
    "todo-sh"
    "topydo"
    "ttdl"
    # keep-sorted end
  ];
}
