args:
args.module (
  args
  // {
    path = ./.;
    progs.emacs.extraConfig = builtins.readFile ./config.el;
  }
)
