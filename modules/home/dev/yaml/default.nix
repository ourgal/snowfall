{
  nixPkgs = [
    # keep-sorted start
    "yaml-language-server"
    "yamlfix"
    "yamllint"
    # keep-sorted end
  ];
  enable = "yamlfmt";
}
