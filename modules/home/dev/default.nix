{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "whitespace-format";
    nixPkgs = [
      "cachix"
      "devbox"
      "devenv"
      "keep-sorted"
      "nap"
      "treefmt2"
      "universal-ctags"
    ];
    progs = {
      direnv = {
        nix-direnv.enable = true;
      };
    };
    enable = [
      "android"
      "ansible"
      "c"
      "cookiecutter"
      "cpp"
      "cue"
      "dart"
      "deno"
      "dhall"
      "docker"
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
      "log"
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
    ];
  }
)
