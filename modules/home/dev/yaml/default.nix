{
  myPkgs = [
    # keep-sorted start
    "bafi"
    "config-file-validator"
    "convfmt"
    "otree"
    # keep-sorted end
  ];
  nixPkgs = [
    # keep-sorted start
    "dasel"
    "dyff"
    "faq"
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
