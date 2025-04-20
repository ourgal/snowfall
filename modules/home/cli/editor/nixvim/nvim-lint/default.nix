{
  progs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      text = [ "vale" ];
      json = [ "jsonlint" ];
      markdown = [ "vale" ];
      rst = [ "vale" ];
      ruby = [ "ruby" ];
      janet = [ "janet" ];
      inko = [ "inko" ];
      clojure = [ "clj-kondo" ];
      dockerfile = [ "hadolint" ];
      terraform = [ "tflint" ];
    };
  };
}
