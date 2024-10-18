args:
args.module (
  args
  // (
    let
      inherit (args) enabled disabled;
    in
    {
      path = ./.;
      progs.git.delta = enabled // {
        catppuccin = disabled;
        options = {
          true-color = "always";
          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-decoration-style = "none";
            file-style = "bold yellow ul";
          };
          features = "decorations";
          whitespace-error-style = "22 reverse";
        };
      };
    }
  )
)
