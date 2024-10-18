args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        enabled
        disabled
        ;
      inherit (config.${namespace}) awesome;
      conf =
        if (awesome.alphaTechnolog == enabled) then
          { alphaTechnolog = enabled; }
        else if (awesome.tartarus == enabled) then
          { tartarus = enabled; }
        else if (awesome."0xTux" == enabled) then
          { tartarus = enabled; }
        else if (awesome.Amitabha37377.topbar_dock == enabled) then
          { Amitabha37377.topbar_dock = enabled; }
        else if (awesome.minimal == enabled) then
          { minimal = enabled; }
        else if (awesome.minimalFnl == enabled) then
          { minimal = enabled; }
        else
          { minimal = enabled; };
    in
    {
      path = ./.;
      value = {
        ${namespace}.desktop.system.picom = conf // {
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
