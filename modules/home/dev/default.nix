{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) toTOML;
    in
    {
      path = ./.;
      myPkgs = [
        # keep-sorted start
        "treegen"
        "whitespace-format"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "cachix"
        "devbox"
        "devenv"
        "honcho"
        "keep-sorted"
        "nap"
        "process-compose"
        "reuse"
        "treefmt2"
        "universal-ctags"
        "watchexec"
        "watchman"
        # keep-sorted end
      ];
      confs = {
        "treefmt/config.toml" = toTOML {
          formatter = {
            toml = {
              command = "taplo";
              options = [ "fmt" ];
              includes = [ "*.toml" ];
            };
            json = {
              command = "fixjson";
              options = [ "-w" ];
              includes = [ "*.json" ];
            };
            yaml = {
              command = "yamlfmt";
              includes = [
                "*.yaml"
                "*.yml"
              ];
            };
            nix = {
              command = "nixfmt";
              includes = [ "*.nix" ];
            };
            python = {
              command = "ruff";
              options = [ "format" ];
              includes = [ "*.py" ];
            };
            lua = {
              command = "stylua";
              includes = [ "*.lua" ];
            };
            fennel = {
              command = "fnlfmt";
              options = [ "--fix" ];
              includes = [ "*.fnl" ];
            };
            markdown = {
              command = "mdformat";
              includes = [ "*.md" ];
            };
            shfmt = {
              command = "shfmt";
              options = [
                "-s"
                "-w"
              ];
              includes = [ "*.sh" ];
            };
            go = {
              command = "gofmt";
              options = [ "-w" ];
              includes = [ "*.go" ];
            };
          };
        };
      };
      progs = {
        direnv = {
          nix-direnv.enable = true;
        };
      };
      enable = [
        # keep-sorted start
        "android"
        "ansible"
        "cookiecutter"
        "cpp"
        "dhall"
        "editorconfig"
        "fennel"
        "go"
        "json"
        "lua"
        "markdown"
        "network"
        "nix"
        "nodejs"
        "perl"
        "php"
        "python"
        "regex"
        "rust"
        "sh"
        "share"
        "spell"
        "toml"
        "vim"
        "yaml"
        # keep-sorted end
      ];
    }
  )
)
