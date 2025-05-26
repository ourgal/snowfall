{
  nixPkgs = [
    # keep-sorted start
    "nix-search-tv"
    "television"
    # keep-sorted end
  ];
  confs = {
    "television/config.toml" = {
      ui = {
        use_nerd_font_icons = false;
        ui_scale = 90;
      };
    };
    "television/nix_channels.toml" = {
      cable_channel = [
        {
          name = "nixpkgs";
          source_command = "nix-search-tv print";
          preview_command = "nix-search-tv preview {}";
        }
      ];
    };
    "nix-search-tv/config.json" = {
      indexes = [
        "nixpkgs"
        "home-manager"
        "nur"
      ];
      experimental = {
        render_docs_indexes = {
          nvf = "https://notashelf.github.io/nvf/options.html";
        };
      };
    };
  };
}
