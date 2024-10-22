args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = (
      p:
      with p;
      [
        # keep-sorted start
        cat_win
        chepy
        # keep-sorted end
      ]
      ++ cat_win.optional-dependencies.clip
    );
    nixPkgs = [
      # keep-sorted start
      "chars"
      "gotemplate"
      "pyp"
      "sttr"
      "teip"
      # keep-sorted end
    ];
  }
)
