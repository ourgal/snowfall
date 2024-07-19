{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "biome"
      "fx"
      "jq"
      "jqp"
      "jsonfmt"
      "yj"
      "yq-go"
    ];
    nodePkgs = [
      "fixjson"
      "vscode-json-languageserver"
    ];
    myPkgs = "vscode-json-language-server";
  }
)
