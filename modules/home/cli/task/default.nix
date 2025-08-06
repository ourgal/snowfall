{
  nixPkgs = "grit";
  myPkgs = "rust-kanban";
  enable = [
    # keep-sorted start
    "eureka"
    "taskwarrior"
    "todo-sh"
    "topydo"
    "ttdl"
    # keep-sorted end
  ];
}
