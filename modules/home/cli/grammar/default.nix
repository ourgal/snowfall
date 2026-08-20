{
  nixPkgs = p: [
    # keep-sorted start
    p.enchant
    p.hunspell
    p.languagetool
    p.wordnet
    # keep-sorted end
    (p.aspellWithDicts (
      dicts: with dicts; [
        # keep-sorted start
        en
        en-computers
        en-science
        # keep-sorted end
      ]
    ))
  ];
}
