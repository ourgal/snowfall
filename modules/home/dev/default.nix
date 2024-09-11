{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) inputs;
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
        "treefmt2"
        "universal-ctags"
        "watchexec"
        "watchman"
        # keep-sorted end
      ];
      confs = {
        "treefmt/config.toml" = inputs.nix-std.lib.serde.toTOML {
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
        "c"
        "cookiecutter"
        "cpp"
        "cue"
        "dart"
        "deno"
        "dhall"
        "dot"
        "dotnet"
        "editorconfig"
        "fennel"
        "fsharp"
        "go"
        "haskell"
        "json"
        "jsonnet"
        "k8s"
        "latex"
        "lisp"
        "lua"
        "markdown"
        "network"
        "nickel"
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
        "sqlite"
        "toml"
        "typst"
        "vim"
        "web"
        "yaml"
        "zig"
        # keep-sorted end
      ];
    }
  )
)
