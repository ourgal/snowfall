{
  description = "SnowFall config";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*.tar.gz";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    snowfall-lib = {
      url = "github:ourgal/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri.url = "github:sodiboo/niri-flake";
    deploy-rs = {
      url = "github:serokell/deploy-rs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homeage.url = "github:jordanisaacs/homeage";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    wired = {
      url = "github:Toqozz/wired-notify";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nyaa = {
      url = "github:Beastwick18/nyaa";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    snowfall-flake = {
      url = "github:snowfallorg/flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowfall-thaw = {
      url = "github:snowfallorg/thaw";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    arion = {
      url = "github:hercules-ci/arion";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-std.url = "github:chessai/nix-std";
    gitwatch = {
      url = "github:gitwatch/gitwatch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvfetcher = {
      url = "github:berberman/nvfetcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pog = {
      url = "github:jpetrucciani/pog";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowfall-drift = {
      url = "github:snowfallorg/drift";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lem = {
      url = "github:lem-project/lem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    telega-overlay = {
      url = "github:ourgal/telega-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-monitored = {
      url = "github:ners/nix-monitored";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "http://harmonia.zxc.cn?priority=102"
      "https://mirror.nju.edu.cn/nix-channels/store?priority=101"
      "https://nix-community.cachix.org?priority=99"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs =
    inputs:
    let
      inherit (inputs) snowfall-lib;

      lib = snowfall-lib.mkLib {
        inherit inputs;
        src = ./.;

        snowfall = {
          meta = {
            name = "dotfiles";
            title = "dotfiles";
          };

          namespace = "dot";
        };
      };
      homeSpecialArgs = {
        module = lib.homeModule;
        inherit (lib)
          enabledList
          disabledList
          enabled
          disabled
          enableOpt
          disableOpt
          mkOpt'
          cfgHome
          switch
          sources
          toTOML
          ;
      };
      homeSpecialArgsFinal = lib.homeSpecialArgs lib.settings.desktops homeSpecialArgs;
      system = "x86_64-linux";
    in
    lib.mkFlake {
      channels-config = {
        # Allow unfree packages.
        allowUnfree = true;
        joypixels.acceptLicense = true;
        allowUnfreePredicate = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [ "nvdia-x11" ];
        permittedInsecurePackages = [
          "openssl-1.1.1w" # for koreader
          "dotnet-sdk-6.0.428" # for sonarr
          "aspnetcore-runtime-6.0.36" # for sonarr
          "beekeeper-studio-5.1.5"
          "ventoy-1.1.05"
        ];
      };

      overlays = with inputs; [
        wired.overlays.default
        # neovim-nightly-overlay.overlays.default
        snowfall-flake.overlays."package/flake"
        snowfall-thaw.overlays."package/thaw"
        snowfall-drift.overlays."package/drift"
        nixpkgs-f2k.overlays.window-managers
        nvfetcher.overlays.default
        nix-vscode-extensions.overlays.default
        pog.overlays.${system}.default
        nur.overlays.default
        # telega-overlay.overlay
        nix-monitored.overlays.default
      ];

      # Add modules to all NixOS systems.
      systems.modules.nixos = with inputs; [
        niri.nixosModules.niri
        catppuccin.nixosModules.catppuccin
        disko.nixosModules.disko
        arion.nixosModules.arion
        sops-nix.nixosModules.sops
        nix-monitored.nixosModules.default
      ];

      homes.modules = with inputs; [
        homeage.homeManagerModules.homeage
        sops-nix.homeManagerModules.sops
        nix-colors.homeManagerModules.default
        wired.homeManagerModules.default
        nix-index-database.hmModules.nix-index
        catppuccin.homeModules.catppuccin
        nixvim.homeManagerModules.nixvim
        nyaa.homeManagerModule
        nvchad4nix.homeManagerModule
        nix-doom-emacs-unstraightened.hmModule
      ];

      templates = {
        base.description = "base template";
      };

      homes.users = homeSpecialArgsFinal;

      deploy = lib.mkDeploy { inherit (inputs) self; };

      modules.home-transform = lib.homeModule;
    };
}
