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
      startWhenNeeded = true;
    };
    programs.mosh = enabled;
    environment.systemPackages = [ pkgs.${namespace}.trzsz-go ];
  };
  _args = { inherit value args; };
in
nixosModule _args
