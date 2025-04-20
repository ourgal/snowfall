{
  path = ./.;
  nixPkgs = "shellclear";
  progs.fish.interactiveShellInit = "shellclear --init-shell | source";
}
