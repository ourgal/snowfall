args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "neomutt";
    confs.neomutt = [
      ./neomuttrc
      ./mappings
      ./settings
      ./colors
      ./mailcap
    ];
  }
)
