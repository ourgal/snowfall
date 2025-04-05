args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.postgresqlBackup = enabled // {
      backupAll = false;
      location = "/var/backup/postgresql";
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
