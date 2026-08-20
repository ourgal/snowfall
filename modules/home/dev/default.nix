{
  myPkgs = "whitespace-format";
  nixPkgs = [
    # keep-sorted start
    "devbox"
    "devenv"
    "exercism"
    "keep-sorted"
    "nvchecker"
    "treefmt"
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
    "ansible"
    "blog"
    "editorconfig"
    "efm"
    "execline"
    "json"
    "markdown"
    "nix"
    "nodejs"
    "python"
    "rust"
    "sh"
    "spell"
    "toml"
    "vim"
    "yaml"
    # keep-sorted end
  ];
}
