args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = [
        # keep-sorted start
        "csharp-ls"
        "dotnet-sdk_8"
        "omnisharp-roslyn"
        # keep-sorted end
      ];
      dotnetPkgs = "Nuget";
      env.DOTNET_ROOT = "${pkgs.dotnet-sdk_8}";
      sessionPath = [ "$HOME/.dotnet/tools" ];
    }
  )
)
