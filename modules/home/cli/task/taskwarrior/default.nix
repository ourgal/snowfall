{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      better-recur = pkgs.fetchFromGitHub {
        owner = "scottyob";
        repo = "taskwarrior-better-recur";
        rev = "2731e1c441d81a3b2217b132e1f40ce4ea49ec5f";
        hash = "sha256-FpUX+6cOZUhv2ZDHwqlwyl1413RJaekvBADZ4486YPU=";
      };
      relative-recur = pkgs.fetchFromGitHub {
        owner = "mlaradji";
        repo = "task-relative-recur";
        rev = "5d4ab7d0a5e3f697fb2a00790972e6f3f705fe42";
        hash = "sha256-oPK67wG0wiUZCgCMtdwvK8w/WKjq3fMbZ9G1HVuVO6Q=";
      };
    in
    {
      path = ./.;
      nixPkgs = [
        "taskwarrior-tui"
        "timewarrior"
      ];
      progs = [
        {
          taskwarrior = {
            package = pkgs.taskwarrior3;
          };
        }
        {
          fish = {
            shellAbbrs = {
              t = "taskwarrior-tui";
            };
          };
        }
      ];
      value = {
        home.file = {
          ".local/share/task/hooks/on-modify.timewarrior".source = ./on-modify.timewarrior;
          ".local/share/task/hooks/on-modify.relative-recur".source = (
            relative-recur + "/on-modify.relative-recur"
          );
          ".local/share/task/hooks/on-modify-complete-recur".source = (
            better-recur + "/on-modify-complete-recur"
          );
          ".local/share/task/hooks/on-add-expire".source = (better-recur + "/on-add-expire");
        };
      };
    }
  )
)
