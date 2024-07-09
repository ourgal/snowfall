{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule dockerOpenFirewall;
  docker = config.${namespace}.docker;
  value = dockerOpenFirewall docker;
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
