{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "biome"
      "fx"
      "jsonfmt"
      "yj"
    ];
    nodePkgs = [
      "fixjson"
      "vscode-json-languageserver"
    ];
    myPkgs = "vscode-json-language-server";
  }
)
