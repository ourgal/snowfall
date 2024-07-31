{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = "broot";
    confs = {
      broot = [
        ./conf.hjson
        ./select.hjson
      ];
    };
  }
)
