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
        lib
        ;
    in
    {
      enable = [
        # keep-sorted start
        "add"
        "alias"
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
        "history"
        "hook"
        "ignore"
        "issue"
        "merge"
        "rebase"
        "search"
        "security"
        "stats"
        "sync"
        "template"
        "time-tracking"
        "tui"
        "undo"
        # keep-sorted end
      ];
      progs = {
        git = {
          userName = "ourgal";
          userEmail = "git@fairever.aleeas.com";
          lfs = enabled;
          extraConfig = {
            init.defaultBranch = "main";
            pull = {
              rebase = true;
              default = "current";
            };
            core = {
              editor = config.${namespace}.user.editor;
              excludesfile = "~/.gitignore";
              fsmonitor = true;
              untrackedCache = true;
              compression = 9;
              whitespace = "error";
              preloadindex = true;
              autocrlf = "input";
            };
            advice = {
              addEmptyPathspec = false;
              pushNonFastForward = false;
              statusHints = false;
            };
            status = {
              branch = true;
              showStash = true;
              showUntrackedFiles = "all";
            };
            git-extras = {
              defualt-branch = config.programs.git.extraConfig.init.defaultBranch;
              get.clone-path = "${config.home.homeDirectory}/src";
            };
            push = {
              useForceIfIncludes = true;
              default = "current";
              autoSetupRemote = true;
              followTags = true;
            };
            rebase = {
              autoSquash = true;
              autoStash = true;
              updateRefs = true;
              missingCommitsCheck = "warn";
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
              context = 3;
              interHunkContext = 10;
            };
            fetch = {
              prune = true;
              pruneTags = true;
              all = true;
            };
            help.autocorrect = "prompt";
            commit = {
              verbose = true;
              template = "${config.xdg.configHome}/git/template";
            };
            rerere = {
              enabled = true;
              autoupdate = true;
            };
            log = {
              abbrevCommit = true;
              graphColors = "blue,yellow,cyan,magenta,green,red";
            };
            "color \"decorate\"" = {
              HEAD = "red";
              branch = "blue";
              tag = "yellow";
              remoteBranch = "magenta";
            };
            "color \"branch\"" = {
              current = "magenta";
              local = "default";
              remote = "yellow";
              upstream = "green";
              plain = "blue";
            };
            merge.conflictstyle = "zdiff3";
          }
          // lib.${namespace}.git.hostAliasesConfig;
          package = pkgs.gitFull;
        };
      };
    }
  )
)
