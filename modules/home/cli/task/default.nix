{
  nixPkgs = [
    # keep-sorted start
    "grit"
    "kanban"
    # keep-sorted end
  ];
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
