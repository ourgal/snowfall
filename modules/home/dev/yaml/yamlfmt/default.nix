{
  path = ./.;
  nixPkgs = "yamlfmt";
  confs."yamlfmt/yamlfmt.yaml" = {
    "formatter" = {
      "type" = "basic";
      "include_document_start" = false;
      "drop_merge_tag" = true;
    };
  };
}
