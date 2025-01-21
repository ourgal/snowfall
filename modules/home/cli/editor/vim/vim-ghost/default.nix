args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs.vim.plugins = with pkgs.vimPlugins; [
        vim-ghost
        nvim-yarp
        pkgs.${namespace}.vim-hug-neovim-rpc
      ];
      value.${namespace}.dev.python.global.pkgs = p: [
        p.pynvim
        pkgs.${namespace}.simple-websocket-server
      ];
    }
  )
)
