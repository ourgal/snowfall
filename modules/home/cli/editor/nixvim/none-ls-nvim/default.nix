{
  progs.nixvim.plugins.none-ls = {
    enable = true;
    cmd = [ "bash -c nvim" ];
    debug = true;
    sources = {
      code_actions = {
        statix.enable = true;
        gitsigns.enable = true;
      };
      diagnostics = {
        statix.enable = true;
        deadnix.enable = true;
        pylint.enable = true;
        checkstyle.enable = true;
      };
      formatting = {
        alejandra.enable = true;
        stylua.enable = true;
        shfmt.enable = true;
        nixpkgs_fmt.enable = true;
        google_java_format.enable = false;
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        black = {
          enable = true;
          withArgs = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
      };
      completion = {
        luasnip.enable = true;
        spell.enable = true;
      };
    };
  };
}
