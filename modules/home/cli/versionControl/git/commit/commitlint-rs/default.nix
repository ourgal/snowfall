{
  path = ./.;
  nixPkgs = "commitlint-rs";
  confs."commitlint-rs/config.yaml" = {
    rules = {
      description-empty = {
        level = "error";
      };
      type = {
        level = "error";
        options = [
          "feat"
          "fix"
          "chore"
          "docs"
          "refactor"
          "style"
          "test"
        ];
      };
      subject-empty = {
        level = "ignore";
      };
      footers-empty = {
        level = "ignore";
      };
    };
  };
}
