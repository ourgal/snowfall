args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  url = "https://beacondb.net/v1/geolocate"; # https://bugzilla.redhat.com/show_bug.cgi?id=2284621
  value = {
    services.geoclue2 = enabled // {
      geoProviderUrl = url;
      submissionUrl = url;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
