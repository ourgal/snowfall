{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      nyaa = {
        default_theme = "Catppuccin Macchiato";
        download_client = "Transmission";
        client.download.save_dir = "~/Videos/anime";
      };
    };
  }
)
