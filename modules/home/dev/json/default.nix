{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "biome"
      "faq"
      "fx"
      "jid"
      "jiq"
      "jnv"
      "jq"
      "jqp"
      "jsonfmt"
      "miller"
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
      "jtbl"
      "otree"
      "vscode-json-language-server"
      # keep-sorted end
    ];
  }
)
