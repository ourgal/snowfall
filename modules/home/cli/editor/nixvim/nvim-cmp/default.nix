args:
args.module (
  args
  // (
    let
      inherit (args) enabled;
    in
    {
      path = ./.;
      progs.nixvim.plugins = {
        cmp = enabled;
        cmp-nvim-lsp = enabled; # Enable suggestions for LSP
        cmp-buffer = enabled; # Enable suggestions for buffer in current file
        cmp-path = enabled; # Enable suggestions for file system paths
        cmp_luasnip = enabled; # Enable suggestions for code snippets
        cmp-cmdline = enabled; # Enable autocomplete for command line
      };
      extraConfigLua = builtins.readFile ./config.lua;
    }
  )
)
