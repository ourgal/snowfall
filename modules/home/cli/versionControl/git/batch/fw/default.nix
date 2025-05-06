args:
args.module (
  args
  // (
    let
      inherit (args) config toTOML;
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
      confs = {
        "fw/settings.toml" = {
          workspace = "~/workspace";
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
          git = "soft:chezmoi-windows";
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
          git = "soft:docker";
        };
        "fw/projects/default/home-manager" = toTOML {
          trusted = false;
          git = "soft:home-manager";
        };
        "fw/projects/default/k3s" = toTOML {
          trusted = false;
          git = "soft:k3s";
        };
        "fw/projects/default/learning" = toTOML {
          trusted = false;
          git = "soft:learning";
        };
        "fw/projects/default/linovel" = toTOML {
          trusted = false;
          git = "soft:linovel";
        };
        "fw/projects/default/nb" = toTOML {
          trusted = false;
          git = "git@github.com:ourgal/nb.git";
        };
        "fw/projects/default/nixpkgs" = toTOML {
          trusted = false;
          git = "git@github.com:NixOS/nixpkgs.git";
        };
        "fw/projects/default/snowfall" = toTOML {
          trusted = false;
          git = "soft:snowfall";
          additional_remotes = [
            {
              name = "github";
              git = "git@github.com:ourgal/snowfall.git";
            }
          ];
        };
        "fw/projects/default/wiki" = toTOML {
          trusted = false;
          git = "soft:wiki";
        };
        "fw/projects/default/work" = toTOML {
          trusted = false;
          git = "soft:work";
        };
      };
      value = {
        systemd.user.tmpfiles.rules = [ "d ${config.home.homeDirectory}/.emacs.d - - - -" ];
      };
    }
  )
)
