args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      progs.vim.plugins = [
        "vim-ghost"
        "nvim-yarp" # broken
        "vim-hug-neovim-rpc"
      ];
      value.${namespace}.dev.python.global.pkgs = p: [
        p.pynvim
        pkgs.${namespace}.simple-websocket-server
      ];
    }
  )
)
