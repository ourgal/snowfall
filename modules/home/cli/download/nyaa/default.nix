args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      progs.nyaa = {
        default_theme = "Catppuccin Macchiato";
        download_client = "Transmission";
        client.download.save_dir = "~/Videos/anime";
        package = pkgs.nyaa;
      };
    }
  )
)
