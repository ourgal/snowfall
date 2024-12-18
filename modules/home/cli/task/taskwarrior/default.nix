args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      better-recur = pkgs._sources.taskwarrior-better-recur.src;
      relative-recur = pkgs._sources.task-relative-recur.src;
      timewarrior = pkgs._sources.timewarrior.src;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "tasksh"
        "taskwarrior-tui"
        "timewarrior"
        "vit"
        # keep-sorted end
      ];
      progs.taskwarrior.package = pkgs.taskwarrior3;
      value = {
        home.file = {
          ".local/share/task/hooks/on-modify.timewarrior".source = timewarrior + "/ext/on-modify.timewarrior";
          ".local/share/task/hooks/on-modify.relative-recur".source =
            relative-recur + "/on-modify.relative-recur";
          ".local/share/task/hooks/on-modify-complete-recur".source =
            better-recur + "/on-modify-complete-recur";
          ".local/share/task/hooks/on-add-expire".source = better-recur + "/on-add-expire";
        };
      };
    }
  )
)
