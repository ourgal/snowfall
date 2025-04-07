{ lib, namespace, ... }:
{
  mkPodmanOpts =
    {
      ports ? [ ],
    }:
    let
      inherit (lib.${namespace}) mkOpt';
      inherit (lib.types) port either listOf;
    in
    {
      ports = mkOpt' (either port (listOf port)) ports;
    };
}
