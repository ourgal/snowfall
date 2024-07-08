{ ... }@args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    programs.fish = enabled;
    programs.vim.defaultEditor = true;
    security.doas = enabled;
    programs.light = enabled // {
      brightnessKeys = enabled;
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
