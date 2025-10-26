{ ... }:
# https://github.com/NixOS/nixpkgs/issues/154163#issuecomment-1350599022
# fix ft2000 kernel compile error
_final: prev: { makeModulesClosure = x: prev.makeModulesClosure (x // { allowMissing = true; }); }
