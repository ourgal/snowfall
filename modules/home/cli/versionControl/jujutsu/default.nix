{
  path = ./.;
  myPkgs = "jj-fzf";
  progs = {
    jujutsu.settings = {
      user = {
        name = "ourgal";
        email = "git@fairever.aleeas.com";
      };
      ui.default-command = "log";
    };
    fish.shellAbbrs.jjp = "jj ci && jj branch set main -r @- && jj git push --all";
  };
}
