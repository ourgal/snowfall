{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "cachix"
      "devbox"
      "devenv"
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
      "dart"
      "deno"
      "dhall"
      "docker"
      "dotnet"
      "editorconfig"
      "fennel"
      "go"
      "haskell"
      "json"
      "jsonnet"
      "k8s"
      "latex"
      "log"
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
