{
  myPkgs = "dela";
  progs.fish.interactiveShellInit = "eval (dela configure-shell | string collect)";
}
