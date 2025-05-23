args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace})
    nixosModule
    enabled
    enableOpt
    with'
    ;
  value = {
    services.pipewire = enabled // {
      alsa = enabled // enableOpt [ "support32Bit" ];
      pulse = enabled;
      # If you want to use JACK applications, uncomment this
      #jack = enabled;
    };
    environment.systemPackages = with' pkgs [ "pulseaudio" ];
  };
  _args = { inherit value args; };
in
nixosModule _args
