{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "whitespace-format";
    nixPkgs = [
      # keep-sorted start
      "cachix"
      "devbox"
      "devenv"
      "keep-sorted"
      "nap"
      "treefmt2"
      "universal-ctags"
      "watchexec"
      "watchman"
      # keep-sorted end
    ];
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
