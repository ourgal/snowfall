args:
args.module (
  args
  // (
    let
      inherit (args) pkgs sources;
      better-recur = pkgs.fetchFromGitHub {
        inherit (sources.taskwarrior-better-recur.src)
          owner
          repo
          rev
          sha256
          ;
      };
      relative-recur = pkgs.fetchFromGitHub {
        inherit (sources.task-relative-recur.src)
          owner
          repo
          rev
          sha256
          ;
      };
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "tasksh"
        "taskwarrior-tui"
        "timewarrior"
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
