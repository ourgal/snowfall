args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.vim.plugins = with pkgs.vimPlugins; [
        vim-ghost
        nvim-yarp # broken
        pkgs.${namespace}.vim-hug-neovim-rpc
      ];
      value.${namespace}.dev.python.global.pkgs = p: [
        p.pynvim
        pkgs.${namespace}.simple-websocket-server
      ];
    }
  )
)
