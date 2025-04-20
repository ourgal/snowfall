{
  nixPkgs = "kak-lsp";
  progs.kakoune = {
    config.keyMappings = [
      {
        mode = "insert";
        key = "<tab>";
        effect = "<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>";
        docstring = "Select next snippet placeholder";
      }
      {
        mode = "object";
        key = "a";
        effect = "<a-semicolon>lsp-object<ret>";
        docstring = "LSP any symbol";
      }
      {
        mode = "object";
        key = "<a-a>";
        effect = "<a-semicolon>lsp-object<ret>";
        docstring = "LSP any symbol";
      }
      {
        mode = "object";
        key = "f";
        effect = "<a-semicolon>lsp-object Function Method<ret>";
        docstring = "LSP function or method";
      }
      {
        mode = "object";
        key = "t";
        effect = "<a-semicolon>lsp-object Class Interface Struct<ret>";
        docstring = "LSP class interface or struct";
      }
      {
        mode = "object";
        key = "d";
        effect = "<a-semicolon>lsp-diagnostic-object --include-warnings<ret>";
        docstring = "LSP errors and warnings";
      }
      {
        mode = "object";
        key = "D";
        effect = "<a-semicolon>lsp-diagnostic-object<ret>";
        docstring = "LSP errors";
      }
    ];
    extraConfig = ''
      eval %sh{kak-lsp}
      lsp-enable
    '';
  };
}
