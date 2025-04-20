args:
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
  _args = { inherit value args; };
in
nixosModule _args
