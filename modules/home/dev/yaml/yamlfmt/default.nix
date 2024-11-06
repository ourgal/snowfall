args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "yamlfmt";
    confs."yamlfmt/yamlfmt.yaml" = builtins.toJSON {
      "formatter" = {
        "type" = "basic";
        "include_document_start" = true;
        "drop_merge_tag" = true;
      };
    };
  }
)
