{
  description = "SnowFall config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
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
      url = "github:ezKEa/aagl-gtk-on-nix/release-24.05";
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
      url = "github:nix-community/nixvim/nixos-24.05";
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
        enabledList = lib.enabledList;
        disabledList = lib.disabledList;
        enabled = lib.enabled;
        disabled = lib.disabled;
        enableOpt = lib.enableOpt;
        disableOpt = lib.disableOpt;
        mkOpt' = lib.mkOpt';
        cfgHome = lib.cfgHome;
        tomlFile = lib.tomlFile;
      };
      homeSpecialArgsFinal = lib.homeSpecialArgs lib.settings.desktops homeSpecialArgs;
    in
    lib.mkFlake {
      channels-config = {
        # Allow unfree packages.
        allowUnfree = true;
        joypixels.acceptLicense = true;
        allowUnfreePredicate = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [ "nvdia-x11" ];
      };

      overlays = with inputs; [
        wired.overlays.default
        # neovim-nightly-overlay.overlays.default
        snowfall-flake.overlays."package/flake"
        snowfall-thaw.overlays."package/thaw"
        nixpkgs-f2k.overlays.window-managers
      ];

      # Add modules to all NixOS systems.
      systems.modules.nixos = with inputs; [
        niri.nixosModules.niri
        catppuccin.nixosModules.catppuccin
        disko.nixosModules.disko
        arion.nixosModules.arion
        sops-nix.nixosModules.sops
      ];

      homes.modules = with inputs; [
        homeage.homeManagerModules.homeage
        sops-nix.homeManagerModules.sops
        nix-colors.homeManagerModules.default
        wired.homeManagerModules.default
        nix-index-database.hmModules.nix-index
        catppuccin.homeManagerModules.catppuccin
        nixvim.homeManagerModules.nixvim
        nyaa.homeManagerModule
      ];

      homes.users = homeSpecialArgsFinal;

      deploy = lib.mkDeploy { inherit (inputs) self; };
    };
}
