args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
    in
    {
      progs.ncmpcpp.bindings = lib.${namespace}.mkNcmpcppBindings {
        j = "scroll_down";
        k = "scroll_up";
        l = "next_column";
        h = "previous_column";
      };
    }
  )
)
