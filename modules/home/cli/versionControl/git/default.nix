args:
args.module (
  args
  // (
    let
      inherit (args) config namespace enabled;
    in
    {
      path = ./.;
      enable = [
        # keep-sorted start
        "add"
        "amend"
        "batch"
        "blame"
        "branch"
        "changelog"
        "cli"
        "clone"
        "commit"
        "diff"
        "download"
        "github"
        "hook"
        "ignore"
        "issue"
        "license"
        "merge"
        "rebase"
        "security"
        "stats"
        "sync"
        "time-tracking"
        "tui"
        "undo"
        # keep-sorted end
      ];
      progs.git = {
        userName = "ourgal";
        userEmail = "git@fairever.aleeas.com";
        lfs = enabled;
        extraConfig = {
          init.defaultBranch = "main";
          pull.rebase = true;
          core.editor = config.${namespace}.user.editor;
          git-extras = {
            defualt-branch = config.programs.git.extraConfig.init.defaultBranch;
            get.clone-path = "${config.home.homeDirectory}/src";
          };
          push.useForceIfIncludes = true;
          rebase.autosquash = true;
          maintenance.repo = [ "${config.home.homeDirectory}/workspace/snowfall" ];
        };
      };
    }
  )
)
