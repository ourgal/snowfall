{
  nixPkgs = "nodejs";
  progs.vim = {
    plugins = [
      # keep-sorted start
      "coc-json"
      "coc-nvim"
      "coc-prettier"
      "coc-pyright"
      "coc-r-lsp"
      "coc-sh"
      "coc-snippets"
      "coc-texlab"
      "coc-toml"
      "coc-vimlsp"
      "coc-yaml"
      # keep-sorted end
    ];
    extraConfig = ./config.vim;
  };
}
