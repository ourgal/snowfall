{
  path = ./.;
  progs = {
    zellij = {
      enableFishIntegration = true;
    };
  };
  confs = {
    zellij = ./config.kdl;
  };
  env = {
    ZELLIJ_AUTO_EXIT = "true";
  };
}
