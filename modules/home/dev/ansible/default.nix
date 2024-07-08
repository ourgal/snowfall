{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "ansible"
      "ansible-language-server"
      "ansible-lint"
    ];
  }
)
