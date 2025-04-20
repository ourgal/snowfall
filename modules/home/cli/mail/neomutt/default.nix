{
  nixPkgs = "neomutt";
  confs.neomutt = [
    ./neomuttrc
    ./mappings
    ./settings
    ./colors
    ./mailcap
  ];
}
