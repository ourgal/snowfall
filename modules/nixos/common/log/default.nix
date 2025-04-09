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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
