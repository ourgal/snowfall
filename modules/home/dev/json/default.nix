{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "biome"
      "fx"
      "jid"
      "jnv"
      "jq"
      "jqp"
      "jsonfmt"
      "miller"
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
    myPkgs = "vscode-json-language-server";
  }
)
