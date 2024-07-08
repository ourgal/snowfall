{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "lua"
      "lua-language-server"
      "selene"
      "stylua"
    ];
    luaPkgs = "luarocks-nix";
    value = with args; {
      # for coc.nvim
      xdg.dataFile.lua-language-server.source = "${pkgs.lua-language-server}/share/lua-language-server";
    };
  }
)
