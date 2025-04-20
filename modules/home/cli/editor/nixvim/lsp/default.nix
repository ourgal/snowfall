{
  path = ./.;
  progs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      pyright.enable = true;
      marksman.enable = true;
      nil_ls.enable = true;
      bashls.enable = true;
      csharp_ls.enable = true;
      lua_ls.enable = true;
      html.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
    };
  };
}
