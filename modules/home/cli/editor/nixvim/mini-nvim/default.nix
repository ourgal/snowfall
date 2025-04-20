{
  progs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      comment = {
        mappings = {
          comment = null;
          comment_line = "<C-c>";
          comment_visual = "<C-c>";
          iextobject = "gc";
        };
      };
      ai = { };
      extra = { };
      operators = {
        evaluate = {
          prefix = null;
          func = null;
        };
        exchange = {
          prefix = null;
          reindent_linewise = true;
        };
        multiply = {
          prefix = "ym";
          func = null;
        };
        replace = {
          prefix = "r";
          reindent_linewise = true;
        };
        sort = {
          prefix = "gz";
          func = null;
        };
      };
    };
  };
}
