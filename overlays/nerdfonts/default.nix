{ channels, ... }:
final: prev: { nerdfonts = prev.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; }; }
