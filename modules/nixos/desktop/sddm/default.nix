{ ... }@args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    environment.systemPackages = with pkgs; [ catppuccin-sddm-corners ];
    services.displayManager.sddm = enabled // {
      theme = "catppuccin-sddm-corners";
      wayland = enabled;
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
