{ lib, ... }:
{
  mkSyncthingFolders =
    {
      dataDir,
      host,
      folders, # {folder = [ "host a" "host b" ];}
    }:
    let
      folder =
        {
          name,
          dataDir,
          host,
          hosts ? [ ],
        }:
        {
          path = "${dataDir}/${name}";
          devices = builtins.filter (e: e != host) hosts;

        };
    in
    lib.attrsets.mapAttrs (
      n: v:
      folder {
        inherit dataDir host;
        name = n;
        hosts = v;
      }
    ) folders;
}
