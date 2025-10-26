args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot.kernelModules = [ "bfq" ];
    services.udev.extraRules = ''
      ACTION=="add|change", KERNEL=="nvme[0-9]n[1-9]", ATTR{queue/scheduler}="mq-deadline"
      ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/scheduler}="bfq"
    '';
  };
  _args = { inherit value args; };
in
nixosModule _args
