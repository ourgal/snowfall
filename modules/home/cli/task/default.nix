{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "focus-timer"
      "rust-kankan"
      # keep-sorted end
    ];
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
