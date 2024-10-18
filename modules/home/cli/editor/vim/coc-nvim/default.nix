{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs.vim = {
      plugins = with args.pkgs.vimPlugins; [
        # keep-sorted start
        coc-json
        coc-nvim
        coc-pyright
        coc-r-lsp
        coc-sh
        coc-snippets
        coc-sumneko-lua
        coc-texlab
        coc-toml
        coc-tsserver
        coc-vimlsp
        coc-yaml
        # keep-sorted end
      ];
      extraConfig = builtins.readFile ./config.vim;
    };
  }
)
