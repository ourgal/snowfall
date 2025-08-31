args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace host;
      inherit (lib.${namespace}) settings;
      inherit (builtins) elem;
    in
    {
      myX86Pkgs = "roc-switch";
      nixPkgs = [
        # keep-sorted start
        "alsa-utils"
        "pamixer"
        "pulsemixer"
        # keep-sorted end
      ];
      enable = if elem host settings.desktops && !elem host settings.work then "pipewire" else [ ];
    }
  )
)
