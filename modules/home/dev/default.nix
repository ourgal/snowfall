{
  myPkgs = [
    # keep-sorted start
    "boilr"
    "envset"
    "gaze"
    "lab"
    "qlty"
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
    "dotenv-linter"
    "dtool"
    "eclint"
    "exercism"
    "honcho"
    "keep-sorted"
    "ls-lint"
    "process-compose"
    "reuse"
    "treefmt2"
    "tup"
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
  progs.direnv.nix-direnv.enable = true;
  enable = [
    # keep-sorted start
    "android"
    "ansible"
    "blog"
    "cook"
    "cpp"
    "editorconfig"
    "efm"
    "execline"
    "fennel"
    "fish"
    "go"
    "haskell"
    "html"
    "jinja"
    "json"
    "lisp"
    "lua"
    "markdown"
    "nix"
    "nodejs"
    "org-mode"
    "perl"
    "powershell"
    "python"
    "regex"
    "ruby"
    "rust"
    "sh"
    "share"
    "spell"
    "template"
    "toml"
    "vagrant"
    "vim"
    "yaml"
    # keep-sorted end
  ];
}
