{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      value = {
        home.packages = [
          # keep-sorted start
          pkgs.enchant
          pkgs.hunspell
          pkgs.languagetool
          pkgs.wordnet
          # keep-sorted end
          (pkgs.aspellWithDicts (
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
)
