{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        cfgHome
        lib
        pkgs
        enabled
        disabled
        ;
      inherit (lib) mkIf;
      inherit (lib.${namespace}) switch;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      myPkgs = [
        # keep-sorted start
        "av"
        "git-fame"
        "git-toolbelt"
        "gitcs"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "bfg-repo-cleaner"
        "bit"
        "commitizen"
        "fac"
        "gex"
        "git-absorb"
        "git-backdate"
        "git-bars"
        "git-big-picture"
        "git-branchless"
        "git-bug"
        "git-cliff"
        "git-dive"
        "git-extras"
        "git-filter-repo"
        "git-graph"
        "git-instafix"
        "git-quick-stats"
        "git-sizer"
        "git-upstream"
        "gitleaks"
        "gitmoji-cli"
        "gitnr"
        "gitstats"
        "hub"
        "lefthook"
        "license-cli"
        "mob"
        "pre-commit"
        "tig"
        # keep-sorted end
      ];
      enable = "geminicommit";
      progs = [
        {
          git = {
            userName = "ourgal";
            userEmail = "git@fairever.aleeas.com";
            signing = mkIf cfg.sign.enable {
              key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
              signByDefault = true;
            };
            lfs = enabled;
            delta = enabled // {
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
            extraConfig = {
              credential.helper = "gopass";
              init.defaultBranch = "main";
              pull.rebase = true;
              core.editor = "hx";
              git-extras = {
                defualt-branch = "main";
                get = {
                  clone-path = "${config.home.homeDirectory}/workspace";
                };
              };
              push.useForceIfIncludes = true;
              gpg.format = "ssh";
            };
            hooks = mkIf cfg.hook.enable {
              pre-commit = "${pkgs.${namespace}.git-pre-commit}/bin/git-pre-commit";
              commit-msg = "${pkgs.${namespace}.git-commit-msg}/bin/git-commit-msg";
            };
            aliases = {
              bb = "!${pkgs.${namespace}.better-git-branch}/bin/better-git-branch";
              heat = "!${pkgs.${namespace}.git-heatgrid}/bin/git-heatgrid";
              fame = "!${pkgs.${namespace}.git-fame}/bin/git-fame";
            };
          };
        }
        {
          fish = {
            shellAbbrs = {
              gr = "cd (git root)";
            };
          };
        }
      ];
      extraOpts = {
        hook = switch;
        sign = switch;
      };
    }
  )
)
