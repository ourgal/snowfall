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
  _args = { inherit value args; };
in
nixosModule _args
