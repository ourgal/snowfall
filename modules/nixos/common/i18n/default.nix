args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    i18n.defaultLocale = "en_US.UTF-8";
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
