args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        toTOML
        lib
        namespace
        pkgs
        ;
      soft = lib.${namespace}.git.hostAliases.soft.name;
      myGithub = lib.${namespace}.git.hostAliases.myGithub.name;
      github = lib.${namespace}.git.hostAliases.github.name;
      home = "ssh://home:${config.home.homeDirectory}/workspace";
      conf = {
        "fw/settings.toml" = {
          workspace = "${config.home.homeDirectory}/workspace";
          # shell = [
          #   "/usr/bin/zsh"
          #   "-c"
          # ];
          # default_after_workon = "echo default after workon";
          # default_after_clone = "echo default after clone";
          # github_token = "githubtokensecret";
          # gitlab = {
          #   token = "token";
          #   host = "localhost";
          # };
        };
        "fw/projects/default/chezmoi-windows" = toTOML {
          trusted = false;
          git = "${soft}:chezmoi-windows";
          # after_clone = "echo BROCODE!!";
          # after_workon = "echo workon fw";
          # override_path = "/some/fancy/path/to/fw";
          # bare = false;
          # tags = [
          #   "brocode"
          #   "rust"
          # ];
          # additional_remotes = [
          #   {
          #     name = "upstream";
          #     git = "git@...";
          #   }
          # ];
        };
        "fw/projects/default/docker" = toTOML {
          trusted = false;
          git = "${soft}:docker";
        };
        "fw/projects/default/home-manager" = toTOML {
          trusted = false;
          git = "${soft}:home-manager";
        };
        "fw/projects/default/k3s" = toTOML {
          trusted = false;
          git = "${soft}:k3s";
        };
        "fw/projects/default/learning" = toTOML {
          trusted = false;
          git = "${soft}:learning";
        };
        "fw/projects/default/linovel" = toTOML {
          trusted = false;
          git = "${soft}:linovel";
        };
        "fw/projects/default/nb" = toTOML {
          trusted = false;
          git = "${myGithub}:nb";
        };
        "fw/projects/default/nixpkgs" = toTOML {
          trusted = false;
          git = "${github}:NixOS/nixpkgs";
          additional_remotes = [
            {
              name = "nju";
              git = "https://mirror.nju.edu.cn/git/nixpkgs.git/";
            }
          ];
        };
        "fw/projects/default/snowfall" = toTOML {
          trusted = false;
          git = "${soft}:snowfall";
          additional_remotes = [
            {
              name = "github";
              git = "${myGithub}:snowfall";
            }
            {
              name = "home";
              git = "${home}/snowfall";
            }
          ];
        };
        "fw/projects/default/wiki" = toTOML {
          trusted = false;
          git = "${soft}:wiki";
        };
        "fw/projects/default/work" = toTOML {
          trusted = false;
          git = "${soft}:work";
        };
        "fw/projects/default/epub-blog" = toTOML {
          trusted = false;
          git = "${myGithub}:epub-blog";
        };
        "fw/projects/default/nix-on-droid" = toTOML {
          trusted = false;
          git = "${soft}:nix-on-droid";
        };
        "fw/projects/default/scoop-galgame-cn" = toTOML {
          trusted = false;
          git = "${myGithub}:scoop-galgame-cn";
        };
        "fw/projects/default/scoop-galgame-bt" = toTOML {
          trusted = false;
          git = "${myGithub}:scoop-galgame-bt";
        };
        "fw/projects/default/termux-pkgs" = toTOML {
          trusted = false;
          git = "${myGithub}:termux-pkgs";
        };
      };
    in
    {
      nixPkgs = "fw";
      progs.fish = {
        interactiveShellInit = # fish
          ''
            if test -x (command -v fw)
              if test -x (command -v fzf)
                fw print-fish-setup -f | source
              else
                fw print-fish-setup | source
              end
            end
          '';
      };
      confs = conf;
      cacheFiles."fw_config.onchange" = {
        text = builtins.toJSON conf;
        onchange = ''
          echo "fw update emacs projectile cache"
          $DRY_RUN_CMD ${lib.getExe pkgs.fw} projectile
        '';

      };
      value = {
        systemd.user.tmpfiles.rules = [ "d ${config.home.homeDirectory}/.emacs.d - - - -" ];
      };
    }
  )
)
