{
  myPkgs = (
    p:
    with p;
    [
      # keep-sorted start
      cat_win
      chepy
      complate
      pypipe
      render
      # keep-sorted end
    ]
    ++ cat_win.optional-dependencies.clip
  );
  nixPkgs = [
    # keep-sorted start
    "chars"
    "gotemplate"
    "mustache-go"
    "pyp"
    "sttr"
    "teip"
    # keep-sorted end
  ];
}
