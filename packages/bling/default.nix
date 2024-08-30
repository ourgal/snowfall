{
  lib,
  stdenv,
  fetchFromGitHub,
  lua,
}:

stdenv.mkDerivation {
  pname = "bling";
  version = "unstable-2024-06-02";

  src = fetchFromGitHub {
    owner = "BlingCorp";
    repo = "bling";
    rev = "19ccfc0daf5edda8bbc508487616d00277a9d954";
    hash = "sha256-6NZSUb7sSBUegSIPIubQUOZG3knzXfnyfEbCoEyggtc=";
  };

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
