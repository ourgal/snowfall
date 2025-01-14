args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "ansible"
      "ansible-language-server"
      "ansible-lint"
      # keep-sorted end
    ];
  }
)
