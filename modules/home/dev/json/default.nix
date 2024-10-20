args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "biome"
      "dasel"
      "faq"
      "fx"
      "gjo"
      "jd-diff-patch"
      "jid"
      "jiq"
      "jnv"
      "jo"
      "jq"
      "jqp"
      "jsonfmt"
      "miller"
      "remarshal"
      "visidata"
      "yj"
      "yq-go"
      # keep-sorted end
    ];
    nodePkgs = [
      # keep-sorted start
      "fixjson"
      "prettier"
      "vscode-json-languageserver"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "bafi"
      "convfmt"
      "jtbl"
      "otree"
      "vscode-json-language-server"
      # keep-sorted end
    ];
  }
)
