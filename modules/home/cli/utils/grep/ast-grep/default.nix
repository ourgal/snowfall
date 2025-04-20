{
  path = ./.;
  nixPkgs = "ast-grep";
  progs.fish.functions.sg = {
    body = ''
      ast-grep $argv
    '';
    description = "ast-grep alias";
  };
}
