{ ... }@args:
args.module (
  args
  // (
    with args;
    let
      awesome = config.${namespace}.awesome;
    in
    {
      path = ./.;
      value = {
        ${namespace}.desktop.system.picom = {
          minimal = lib.mkIf ((awesome.minimal == enabled) || (awesome.minimalFnl == enabled)) enabled;
          tartarus = lib.mkIf (awesome.tartarus == enabled) enabled;
          alphaTechnolog = lib.mkIf (awesome.alphaTechnolog == enabled) enabled;
          yoru = disabled;
        };
        xsession = enabled // {
          windowManager.awesome = disabled;
        };
        systemd.user.services.picom.Unit.ConditionEnvironment = "XAUTHORITY";
      };
    }
  )
)
