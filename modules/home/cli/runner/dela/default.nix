args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "dela";
    progs.fish.interactiveShellInit = "eval (dela configure-shell | string collect)";
  }
)
