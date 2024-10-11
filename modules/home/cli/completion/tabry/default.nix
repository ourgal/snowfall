{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "tabry-rs";
    progs = {
      fish = {
        interactiveShellInit = ''
          tabry fish | source
        '';
      };
    };
  }
)
