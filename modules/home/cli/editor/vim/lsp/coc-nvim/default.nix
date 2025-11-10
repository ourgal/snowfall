{
  nixPkgs = "nodejs";
  progs.vim = {
    plugins = [
      # keep-sorted start
      "coc-go"
      "coc-json"
      "coc-nvim"
      "coc-prettier"
      "coc-pyright"
      "coc-r-lsp"
      "coc-sh"
      "coc-snippets"
      "coc-sumneko-lua"
      "coc-texlab"
      "coc-toml"
      "coc-tsserver"
      "coc-vimlsp"
      "coc-yaml"
      # keep-sorted end
    ];
    extraConfig = ./config.vim;
  };
}
