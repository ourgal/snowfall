args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = [
        # keep-sorted start
        "lua"
        "lua-language-server"
        "selene"
        "stylua"
        # keep-sorted end
      ];
      luaPkgs = [
        # keep-sorted start
        "luacheck"
        "luarocks-nix"
        # keep-sorted end
      ];
      value = {
        # for coc.nvim
        xdg.dataFile.lua-language-server.source = "${pkgs.lua-language-server}/share/lua-language-server";
      };
    }
  )
)
