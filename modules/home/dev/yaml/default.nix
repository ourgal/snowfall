{
  myPkgs = "bafi";
  nixPkgs = [
    # keep-sorted start
    "dasel"
    "dyff"
    "faq"
    "otree"
    "remarshal"
    "spruce"
    "yamale"
    "yaml-language-server"
    "yamlfix"
    "yamllint"
    # keep-sorted end
  ];
  enable = "yamlfmt";
}
