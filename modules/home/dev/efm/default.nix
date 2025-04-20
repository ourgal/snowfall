{
  path = ./.;
  nixPkgs = "efm-langserver";
  confs."efm-langserver/config.yaml" = builtins.readFile ./config.yaml;
}
