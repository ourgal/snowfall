{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "focus-timer";
    enable = [
      "eureka"
      "taskwarrior"
      "todo-sh"
      "ttdl"
    ];
  }
)
