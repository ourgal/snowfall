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
        let
          devices = if (builtins.elem host hosts) then builtins.filter (e: e != host) hosts else [ ];
        in
        {
          path = "${dataDir}/${name}";
          inherit devices;
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
