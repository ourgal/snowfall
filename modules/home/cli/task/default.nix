args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "grit";
    myPkgs = "rust-kanban";
    enable = [
      # keep-sorted start
      "eureka"
      "taskwarrior"
      "todo-sh"
      "ttdl"
      # keep-sorted end
    ];
  }
)
