{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    value = with args; {
      home.packages = with pkgs; [
        enchant
        hunspell
        languagetool
        wordnet
        (aspellWithDicts (
          dicts: with dicts; [
            en
            en-computers
            en-science
          ]
        ))
      ];
    };
  }
)
