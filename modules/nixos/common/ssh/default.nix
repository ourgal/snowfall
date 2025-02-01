args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.openssh = enabled // {
      # require public key authentication for better security
      # settings.PasswordAuthentication = false;
      # settings.KbdInteractiveAuthentication = false;
      settings.PermitRootLogin = "yes";
    };
    programs.mosh = enabled;
    environment.systemPackages = [
      pkgs.lrzsz
      pkgs.${namespace}.trzsz-go
    ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
