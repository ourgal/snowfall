{ ... }@args:
args.module (
  args
  // (
    with args;
    let
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "bit"
        "commitizen"
        "fac"
        "gex"
        "git-bug"
        "git-extras"
        "git-graph"
        "gitleaks"
        "hub"
        "lefthook"
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
            signing = lib.mkIf cfg.sign.enable {
              key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
              signByDefault = true;
            };
            lfs = enabled;
            delta = enabled // {
              catppuccin = disabled;
              options = {
                plus-style = "green #26342c";
                plus-emph-style = "green #2b4134";
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
            hooks = lib.mkIf cfg.hook.enable {
              commit-msg = "${pkgs.${namespace}.commit-msg}/bin/commit-msg";
              pre-commit = "${pkgs.${namespace}.git-pre-commit}/bin/git-pre-commit.py";
            };
            aliases = {
              bb = "!${pkgs.${namespace}.better-git-branch}/bin/better-git-branch";
              heat = "!${pkgs.${namespace}.git-heatgrid}/bin/git-heatgrid";
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
      extraOpts = with lib.${namespace}; {
        hook = switch;
        sign = switch;
      };
    }
  )
)
