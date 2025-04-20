args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      better-recur = pkgs._sources.taskwarrior-better-recur.src;
    in
    {
      value = {
        home.file = {
          ".local/share/task/hooks/on-modify-complete-recur".source =
            better-recur + "/on-modify-complete-recur";
          ".local/share/task/hooks/on-add-expire".source = better-recur + "/on-add-expire";
        };
      };
    }
  )
)
