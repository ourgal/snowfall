{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    value = with args; {
      home.packages = with pkgs; [
        # keep-sorted start
        enchant
        hunspell
        languagetool
        wordnet
        # keep-sorted end
        (aspellWithDicts (
          dicts: with dicts; [
            # keep-sorted start
            en
            en-computers
            en-science
            # keep-sorted end
          ]
        ))
      ];
    };
  }
)
