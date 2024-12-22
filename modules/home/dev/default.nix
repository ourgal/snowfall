args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      myPkgs = [
        # keep-sorted start
        "boilr"
        "envset"
        "gaze"
        "whitespace-format"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "actionlint"
        "cachix"
        "checkmake"
        "commitmsgfmt"
        "datefmt"
        "dep-tree"
        "devbox"
        "devenv"
        "dtool"
        "eclint"
        "exercism"
        "honcho"
        "keep-sorted"
        "ls-lint"
        "process-compose"
        "reuse"
        "treefmt2"
        "universal-ctags"
        # keep-sorted end
      ];
      confs = {
        "treefmt/config.toml" = {
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
      progs.direnv.nix-direnv = enabled;
      enable = [
        # keep-sorted start
        "android"
        "cpp"
        "editorconfig"
        "efm"
        "execline"
        "fennel"
        "fish"
        "go"
        "html"
        "json"
        "lua"
        "markdown"
        "nix"
        "nodejs"
        "org-mode"
        "perl"
        "python"
        "regex"
        "rust"
        "sh"
        "share"
        "spell"
        "template"
        "toml"
        "vim"
        "yaml"
        # keep-sorted end
      ];
    }
  )
)
