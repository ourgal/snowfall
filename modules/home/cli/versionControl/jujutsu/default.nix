args:
args.module (
  args
  // {
    path = ./.;
    progs = [
      {
        jujutsu.settings = {
          user = {
            name = "ourgal";
            email = "git@fairever.aleeas.com";
          };
          ui.default-command = "log";
        };
      }
      { fish.shellAbbrs.jjx = "jj ci && jj branch set main -r @- && jj git push --all"; }
    ];
  }
)
