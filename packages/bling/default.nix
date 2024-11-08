{
  lib,
  stdenv,
  lua,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.bling) pname src version;

  buildInputs = [ lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${lua.luaversion}/
    cp -r . $out/lib/lua/${lua.luaversion}/bling/
    printf "package.path = '$out/lib/lua/${lua.luaversion}/?/init.lua;' ..  package.path\nreturn require(...)\n" > $out/lib/lua/${lua.luaversion}/bling.lua
  '';

  meta = with lib; {
    description = "Utilities for the awesome window manager";
    homepage = "https://github.com/BlingCorp/bling";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "bling";
    platforms = platforms.all;
  };
}
