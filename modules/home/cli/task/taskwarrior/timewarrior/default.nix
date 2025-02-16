args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
      timewarrior = pkgs._sources.timewarrior.src;
    in
    {
      path = ./.;
      value.home.file.".local/share/task/hooks/on-modify.timewarrior".source =
        timewarrior + "/ext/on-modify.timewarrior";
    }
  )
)
