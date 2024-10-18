args:
args.module (
  args
  // {
    path = ./.;
    progs.tealdeer.settings = {
      display = {
        compact = false;
        use_paper = true;
      };
      updates = {
        auto_update = true;
      };
    };
  }
)
