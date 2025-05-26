args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        enabled
        pkgs
        ;
    in
    {
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
          core = {
            editor = config.${namespace}.user.editor;
            excludesfile = "~/.gitignore";
            fsmonitor = true;
            untrackedCache = true;
          };
          git-extras = {
            defualt-branch = config.programs.git.extraConfig.init.defaultBranch;
            get.clone-path = "${config.home.homeDirectory}/src";
          };
          push = {
            useForceIfIncludes = true;
            default = "simple";
            autoSetupRemote = true;
            followTags = true;
          };
          rebase = {
            autoSquash = true;
            autoStash = true;
            updateRefs = true;
          };
          maintenance.repo = [ "${config.home.homeDirectory}/workspace/snowfall" ];
          culumn.ui = "auto";
          branch.sort = "-committerdate";
          tag.sort = "version:refname";
          diff = {
            algorithm = "histogram";
            colorMoved = "plain";
            mnemonicPrefix = true;
            renames = true;
          };
          fetch = {
            prune = true;
            pruneTags = true;
            all = true;
          };
          help.autocorrect = "prompt";
          commit.verbose = true;
          rerere = {
            enabled = true;
            autoupdate = true;
          };
          merge.conflictstyle = "zdiff3";
        };
        package = pkgs.gitFull;
      };
    }
  )
)
