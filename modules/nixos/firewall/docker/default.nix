args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule dockerOpenFirewall;
  inherit (config.${namespace}) docker;
  value = dockerOpenFirewall docker;
  _args = { inherit value args; };
in
nixosModule _args
