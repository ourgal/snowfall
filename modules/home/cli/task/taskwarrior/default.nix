args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      better-recur = pkgs._sources.taskwarrior-better-recur.src;
      relative-recur = pkgs._sources.task-relative-recur.src;
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
          ".local/share/task/hooks/on-modify.timewarrior".source = ./on-modify.timewarrior;
          ".local/share/task/hooks/on-modify.relative-recur".source =
            relative-recur + "/on-modify.relative-recur";
          ".local/share/task/hooks/on-modify-complete-recur".source =
            better-recur + "/on-modify-complete-recur";
          ".local/share/task/hooks/on-add-expire".source = ./on-add-expire;
        };
      };
    }
  )
)
