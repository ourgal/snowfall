{ ... }@args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.openssh = enabled // {
      # require public key authentication for better security
      # settings.PasswordAuthentication = false;
      # settings.KbdInteractiveAuthentication = false;
      settings.PermitRootLogin = "yes";
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
