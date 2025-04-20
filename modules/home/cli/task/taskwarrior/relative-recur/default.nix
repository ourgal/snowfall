args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      relative-recur = pkgs._sources.task-relative-recur.src;
    in
    {
      value = {
        home.file = {
          ".local/share/task/hooks/on-modify.relative-recur".source =
            relative-recur + "/on-modify.relative-recur";
        };
      };
    }
  )
)
