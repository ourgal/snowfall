{
  progs.nixvim.plugins = {
    cmp.enable = true;
    cmp-nvim-lsp.enable = true; # Enable suggestions for LSP
    cmp-buffer.enable = true; # Enable suggestions for buffer in current file
    cmp-path.enable = true; # Enable suggestions for file system paths
    cmp_luasnip.enable = true; # Enable suggestions for code snippets
    cmp-cmdline.enable = true; # Enable autocomplete for command line
  };
  extraConfigLua = builtins.readFile ./config.lua;
}
