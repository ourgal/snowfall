args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "proji"
      "templify"
      # keep-sorted end
    ];
    enable = "cookiecutter";
  }
)
