args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    services.journald.extraConfig = ''
      Compress=yes
      SystemMaxUse=3G
      RuntimeMaxUse=500M
      SystemKeepFree=10%
      RuntimeKeepFree=15%
      SystemMaxFileSize=100M
      RuntimeMaxFileSize=50M
      SystemMaxFiles=100
      RuntimeMaxFiles=50
    '';
  };
  _args = { inherit value args; };
in
nixosModule _args
