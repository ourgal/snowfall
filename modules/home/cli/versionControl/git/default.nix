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
        "git-toolbelt"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "git-extras"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
        "amend"
        "blame"
        "branch"
        "changelog"
        "cli"
        "commit"
        "diff"
        "download"
        "github"
        "hook"
        "ignore"
        "issue"
        "license"
        "security"
        "stats"
        "sync"
        "time-tracking"
        "tui"
        "undo"
        # keep-sorted end
      ];
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
              core.editor = config.${namespace}.user.editor;
              git-extras = {
                defualt-branch = "main";
                get = {
                  clone-path = "${config.home.homeDirectory}/workspace";
                };
              };
              push.useForceIfIncludes = true;
              gpg.format = "ssh";
            };
            hooks = mkIf cfg.global_hook.enable {
              pre-commit = "${pkgs.${namespace}.git-pre-commit}/bin/git-pre-commit";
              commit-msg = "${pkgs.${namespace}.git-commit-msg}/bin/git-commit-msg";
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
        global_hook = switch;
        sign = switch;
      };
    }
  )
)
