args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "yamlfmt";
    confs."yamlfmt/yamlfmt.yaml" = {
      "formatter" = {
        "type" = "basic";
        "include_document_start" = true;
        "drop_merge_tag" = true;
      };
    };
  }
)
