args:
args.module (
  args
  // (
    let
      inherit (args) namespace;
      aliases = {
        sc = "systemctl";
        scs = "systemctl start";
        sct = "systemctl status";
        scr = "systemctl restart";
        sco = "systemctl stop";

        scu = "systemctl --user";
        scus = "systemctl --user start";
        scut = "systemctl --user status";
        scur = "systemctl --user restart";
        scuo = "systemctl --user stop";
      };
    in
    {
      progs.fish.shellAbbrs = aliases;
      value = {
        ${namespace}.cli.utils.alias.aliae.alias = aliases;
      };
    }
  )
)
