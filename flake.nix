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
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nix-on-droid-nixpkgs";
      inputs.home-manager.follows = "nix-on-droid-home-manager";
    };
    nix-on-droid-home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nix-on-droid-nixpkgs";
    };
    nix-on-droid-nixpkgs = {
      url = "github:NixOS/nixpkgs/release-24.05";
    };
    copyparty = {
      url = "github:9001/copyparty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ulauncher = {
      url = "github:Ulauncher/Ulauncher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    winapps = {
      url = "github:winapps-org/winapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    doxx = {
      url = "github:bgreenwell/doxx";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-n1 = {
      url = "github:slaier/nixos-n1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    colmena.url = "github:zhaofengli/colmena/stable";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lazyvim = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://mirrors.cernet.edu.cn/nix-channels/store?priority=10"
      "https://nix-community.cachix.org?priority=100"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs =
    inputs:
    let
      inherit (inputs) snowfall-lib nix-on-droid;

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
      inherit (lib) SpecialArgs;
      homeSpecialArgsFinal = lib.homeSpecialArgs lib.settings.homeManager SpecialArgs;
      systemSpecialArgsFinal = lib.systemSpecialArgs lib.settings.nixOS SpecialArgs;
      system = "x86_64-linux";

      eachSystem =
        f:
        inputs.nixpkgs.lib.genAttrs [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ] (
          system: f inputs.nixpkgs.legacyPackages.${system}
        );
      # Eval the treefmt modules from ./treefmt.nix
      treefmtEval = eachSystem (pkgs: inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix);
    in
    lib.mkFlake {
      channels-config = {
        # Allow unfree packages.
        allowUnfree = true;
        segger-jlink.acceptLicense = true;
        joypixels.acceptLicense = true;
        allowUnfreePredicate = pkg: builtins.elem (inputs.nixpkgs.lib.getName pkg) [ "nvdia-x11" ];
        permittedInsecurePackages =
          let
            koreader = [ "openssl-1.1.1w" ];
            sonarr = [
              "dotnet-sdk-6.0.428"
              "aspnetcore-runtime-6.0.36"
            ];
            beekeeper = [ "beekeeper-studio-5.1.5" ];
            ventoy = [ "ventoy-1.1.05" ];
            jlink = [ "segger-jlink-qt4-810" ];
          in
          koreader ++ sonarr ++ beekeeper ++ ventoy ++ jlink;
      };

      overlays =
        let
          snowfall-flake = inputs.snowfall-flake.overlays."package/flake";
          snowfall-thaw = inputs.snowfall-thaw.overlays."package/thaw";
          snowfall-drift = inputs.snowfall-drift.overlays."package/drift";
          nixpkgs-f2k = inputs.nixpkgs-f2k.overlays.window-managers;
          nvfetcher = inputs.nvfetcher.overlays.default;
          nix-vscode-extensions = inputs.nix-vscode-extensions.overlays.default;
          pog = inputs.pog.overlays.${system}.default;
          nur = inputs.nur.overlays.default;
          nix-monitored = inputs.nix-monitored.overlays.default;
          copyparty = inputs.copyparty.overlays.default;
        in
        [
          snowfall-flake
          snowfall-thaw
          snowfall-drift
          nixpkgs-f2k
          nvfetcher
          nix-vscode-extensions
          pog
          nur
          nix-monitored
          copyparty
        ];

      # Add modules to all NixOS systems.
      systems.modules.nixos =
        let
          niri = inputs.niri.nixosModules.niri;
          catppuccin = inputs.catppuccin.nixosModules.catppuccin;
          disko = inputs.disko.nixosModules.disko;
          arion = inputs.arion.nixosModules.arion;
          sops-nix = inputs.sops-nix.nixosModules.sops;
          nix-monitored = inputs.nix-monitored.nixosModules.default;
        in
        [
          niri
          catppuccin
          disko
          arion
          sops-nix
          nix-monitored
        ];

      systems.hosts = lib.attrsets.recursiveUpdate systemSpecialArgsFinal {
        n1.modules = with inputs.nixos-n1.nixosModules; [
          dtos
          gpu
          loader
          misc
          wireless
          filesystem
        ];
        t4.modules = [ inputs.nixos-hardware.nixosModules.friendlyarm-nanopc-t4 ];
      };

      homes.modules =
        let
          homeage = inputs.homeage.homeManagerModules.homeage;
          sops-nix = inputs.sops-nix.homeManagerModules.sops;
          nix-colors = inputs.nix-colors.homeManagerModules.default;
          wired = inputs.wired.homeManagerModules.default;
          nix-index-database = inputs.nix-index-database.hmModules.nix-index;
          catppuccin = inputs.catppuccin.homeModules.catppuccin;
          nixvim = inputs.nixvim.homeManagerModules.nixvim;
          nyaa = inputs.nyaa.homeManagerModule;
          nvchad4nix = inputs.nvchad4nix.homeManagerModule;
          nix-doom-emacs-unstraightened = inputs.nix-doom-emacs-unstraightened.hmModule;
          lazyvim = inputs.lazyvim.homeManagerModules.default;
        in
        [
          homeage
          sops-nix
          nix-colors
          wired
          nix-index-database
          catppuccin
          nixvim
          nyaa
          nvchad4nix
          nix-doom-emacs-unstraightened
          lazyvim
        ];

      templates = {
        base.description = "base template";
      };

      homes.users = homeSpecialArgsFinal;

      deploy = lib.mkDeploy {
        inherit (inputs) self;
        extraNodes =
          let
            activateNixOnDroid =
              configuration:
              inputs.deploy-rs.lib.aarch64-linux.activate.custom configuration.activationPackage "${configuration.activationPackage}/activate";
            inherit (inputs) self;
          in
          {
            default = {
              hostname = lib.ip.m6;
              profiles.system = {
                sshUser = "nix-on-droid";
                user = "nix-on-droid";
                magicRollback = true;
                sshOpts = [
                  "-p"
                  "8022"
                ];
                path = activateNixOnDroid self.nixOnDroidConfigurations.default;
              };
            };
          };
      };

      colmenaHive = lib.mkColmenaHive inputs.self.pkgs.${system}.nixpkgs;

      modules = {
        home-transform = lib.homeModule;
        system-transform = lib.homeModule;
      };

      nixOnDroidConfigurations.default =
        let
          extraSpecialArgs = { inherit (lib) toTOML; };
        in
        nix-on-droid.lib.nixOnDroidConfiguration {
          pkgs = import inputs.nix-on-droid-nixpkgs {
            system = "aarch64-linux";
            overlays = [
              (final: _prev: {
                sources = import ./_sources/generated.nix {
                  inherit (final)
                    fetchurl
                    fetchgit
                    fetchFromGitHub
                    dockerTools
                    ;
                };
              })
            ];
          };
          inherit extraSpecialArgs;
          modules = [
            ./nix-on-droid
            {
              user = {
                uid = 10426;
                gid = 10426;
              };
              home-manager = { inherit extraSpecialArgs; };
            }
          ];
        };

      formatter = eachSystem (pkgs: treefmtEval.${pkgs.system}.config.build.wrapper);
      checks = eachSystem (pkgs: {
        formatting = treefmtEval.${pkgs.system}.config.build.check inputs.self;
      });
    };
}
