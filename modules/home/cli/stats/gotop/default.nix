{
  path = ./.;
  nixPkgs = "gotop";
  progs.fish.functions.gotop = {
    body = ''
      TERM=xterm-256color command gotop $argv
    '';
    description = "gotop";
    wraps = "gotop";
  };
}
