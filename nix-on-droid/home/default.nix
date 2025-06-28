{ pkgs, ... }:
{
  home.stateVersion = "24.05";

  programs = {
    fish.enable = true;
    git = {
      enable = true;
      userName = "ourgal";
      userEmail = "git@fairever.aleeas.com";
      lfs.enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        pull = {
          rebase = true;
          default = "current";
        };
        core = {
          editor = "vi";
          excludesfile = "~/.gitignore";
          fsmonitor = true;
          untrackedCache = true;
          compression = 9;
          whitespace = "error";
          preloadindex = true;
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
      };
      package = pkgs.gitFull;
    };
    fzf.enable = true;
    ssh = {
      enable = true;
      package = pkgs.openssh;
    };
  };
  home.packages = with pkgs; [
    btop
    htop
    dufs
  ];
}
